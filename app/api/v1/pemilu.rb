module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :dpt do
      desc "Return all DPT of Surabaya"
      get do
        dpts = Array.new

        # Prepare conditions based on params
        valid_params = {
          kelurahan: 'village_id',
          kecamatan: 'subdistrict_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Dpt.includes(:subdistrict, :village)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |dpt|
            dpts << {
              id: dpt.id,
              kecamatan: {
                id: dpt.subdistrict_id,
                name: dpt.subdistrict.name
              },
              kelurahan: {
                id: dpt.village_id,
                name: dpt.village.name
              },
              jml_tps: dpt.jml_tps,
              jml_laki_laki: dpt.jml_laki_laki,
              jml_perempuan: dpt.jml_perempuan,
              jml_laki_laki_perempuan: dpt.jml_laki_laki_perempuan
            }
          end

        {
          results: {
            count: dpts.count,
            total: Dpt.where(conditions).count,
            dpt: dpts
          }
        }
      end
    end

    resource :kecamatan do
      desc "Return all Subdistrict"
      get do
        subdistricts = Array.new

        Subdistrict.all.each do |subdistrict|
          subdistricts << {
            id: subdistrict.id,
            nama: subdistrict.name,
            jumlah_kelurahan: subdistrict.villages.count
          }
        end

        {
          results: {
            count: Subdistrict.count,
            total: Subdistrict.count,
            subdistricts: subdistricts
          }
        }
      end
    end

    resource :kelurahan do
      desc "Return all Subdistrict"
      get do
        villages = Array.new

        Village.all.each do |village|
          villages << {
            id: village.id,
            nama: village.name
          }
        end

        {
          results: {
            count: Village.count,
            total: Village.count,
            villages: villages
          }
        }
      end
    end
  end
end
class Spree::Api::V1::DatabaseController < Spree::Api::V1::BaseController
  def export
    if current_api_user.has_role?("admin")
      require 'yaml_db'
      format_class = "YamlDb::Helper"
      helper = format_class.constantize
      SerializationHelper::Base.new(helper).dump(db_dump_data_file)
      render :file => db_dump_data_file, :content_type => 'text/yaml'
    else
      render :text => "Access Denied"
    end
  end

  def db_dump_data_file (extension = "yml")
    "#{dump_dir}/data.#{extension}"
  end

  def dump_dir(dir = "")
    @dir ||= "#{Rails.root}/tmp/db_dump/#{Time.now.to_i}"
    FileUtils.mkdir_p(@dir)
    @dir
  end
end

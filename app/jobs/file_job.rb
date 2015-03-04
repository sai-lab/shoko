class FileJob < ActiveJob::Base
  queue_as :file

  SAVE_DIR = "#{Rails.root}/public/documents"

  def perform(id, old_title)
    if old_title
      File.delete "#{SAVE_DIR}/#{old_title}.md"
      delete_dir_p old_title
    end

    if id
      document = Document.id_is id
      dir_path = get_dir_path document.title
      file_name = document.title.split('/').last

      FileUtils.mkdir_p dir_path
      write_file "#{dir_path}/#{file_name}.md", document.markdown
    end
  end

  def get_dir_path(title)
    dir = title.scan(/(.+)\/.+$/).flatten.first

    if dir
      return "#{SAVE_DIR}/#{dir}"
    else
      return SAVE_DIR
    end
  end

  def write_file(file_path, markdown)
    File.open(file_path, 'w') do |f|
      f.print markdown
    end
  end

  def delete_dir_p(old_title)
    dirs = old_title.split('/')
    dirs.pop

    while dirs.size > 0
      dir = "#{SAVE_DIR}/#{dirs.join '/'}"
      if Dir.entries(dir).join == '...'
        Dir.rmdir dir
        dirs.pop
      else
        break
      end
    end
  end
end

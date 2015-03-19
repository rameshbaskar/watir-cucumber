module TestManager
  def prepare_results_dir
    puts 'Preparing results folder...'
    FileUtils.rm_rf results_dir
    FileUtils.mkpath screenshots_dir
  end

  def root_folder
    File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end

  def pages_dir
    File.join(root_folder, 'pages')
  end

  def utils_dir
    File.join(root_folder, 'utils')
  end

  def results_dir
    File.join(root_folder, 'results')
  end

  def screenshots_dir
    File.join(results_dir, 'screenshots')
  end

  def screenshot_file_path
    file_name = "screenshot_#{current_time}.png"
    File.join(screenshots_dir, file_name)
  end

  def browser_to_use
    [:firefox, :chrome].sample
  end

  def should_fail_fast?
    ENV['FAIL_FAST'] == 'true'
  end
end

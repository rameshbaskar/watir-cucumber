module TestManager
  def self.initialize
    environment = ENV["TEST_ENV"] || "local_dev"
    puts "Using #{environment} ..."
    @config = YAML.load_file(File.join(root_folder, "config", "environments.yml"))[environment]
    prepare_results_dir

    @config.each do |k,v|
      self.class.send :define_method, k do v end
    end
  end

  def self.root_folder
    File.expand_path(File.join(File.dirname(__FILE__), ".."))
  end

  def self.utils_dir
    File.join(root_folder, "utils")
  end

  def self.pages_dir
    File.join(root_folder, "pages")
  end

  def self.results_dir
    File.join(root_folder, "results")
  end

  def self.screenshots_dir
    File.join(results_dir, "screenshots")
  end

  def self.models_dir
    File.join(root_folder, "models")
  end

  def self.screenshot_file_path
    file_name = "screenshot_#{current_time}.png"
    File.join(screenshots_dir, file_name)
  end

  def self.prepare_results_dir
    puts "Preparing results folder..."
    FileUtils.rm_rf results_dir
    FileUtils.mkpath screenshots_dir
  end

  def self.should_fail_fast?
    ENV["FAIL_FAST"] == "true"
  end
end

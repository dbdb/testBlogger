require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
end

After do |scenario|
  if scenario.failed?
    file_name = Time.now.to_f.to_s + '.png' # TODO use clear file names
    @current_page.save_screenshot(FigNewton.framework.results_dir + file_name)

    embed file_name, "image/png"
  end

  @browser.close
end


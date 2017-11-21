namespace :magento2 do
  def parse_magento2_args(args)
    args = args[2..-1] if args.length > 2
    args
  end

  task :magento do
    args = parse_php_args(ARGV)
    services_from_args(services: %w[web]).exec('root', "container magento #{args.join(' ')}")
    exit $CHILD_STATUS.to_i
  end

  task :clean_magento_files do
    STDOUT.puts '==> Cleaning Magento2 files'
    %w[.htaccess .htaccess.sample .php_cs .travis.yml .user.ini CHANGELOG.md CONTRIBUTING.md COPYING.txt
       Gruntfile.js.sample index.php ISSUE_TEMPLATE.md LICENSE.txt LICENSE_AFL.txt nginx.conf.sample
       package.json.sample php.ini.sample pub/.htaccess pub/.user.ini .php_cs.dist grunt-config.json.sample
       LICENSE_EE.txt PULL_REQUEST_TEMPLATE.md README_EE.md bin/.htaccess phpserver].each do |file|
      FileUtils.rm_rf(file)
    end
    STDOUT.puts '==> Cleaned Magento2 files'
  end
end

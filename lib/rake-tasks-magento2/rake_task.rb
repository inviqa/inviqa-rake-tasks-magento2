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
end

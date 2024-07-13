Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require 'rom'

    opts = {
      username: 'postgres_admin',
      password: 'password101!:)',
      encoding: 'UTF8',
      search_path: 'wedding_invite'
    }

    config = ROM::Configuration.new(:sql, target['settings'].database_url, opts)

    register 'config', config
    register 'db', config.gateways[:default].connection
  end

  start do
    config = target['persistence.config']

    config.auto_registration(
      target.root.join('lib/wedding_invite/persistence'),
      namespace: 'WeddingInvite::Persistence'
    )

    register 'rom', ROM.container(config)
  end
end

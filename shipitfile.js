require('colors')

module.exports = ship => {
  const done = () => {
    ship.log('')
    ship.log('Done.'.green)
    ship.log('')
  }

  ship.initConfig({
    staging: {
      servers: 'tekzenit@tekzenit.pt:6666'
    }
  })

  ship.task('deploy', () => {
    ship
      .local('gulp dist')
      .then(() => {
        ship
          .remoteCopy('dist/', '~/public_html/labs/dr-pardal/')
          .then(done)
      })
  })
}

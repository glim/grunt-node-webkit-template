module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('./src/package.json'),
    nodewebkit: {
      options: {
        build_dir: './build', // Where the build version of my node-webkit app is saved
        credits: './src/credits.html',
        mac_icns: './icon.icns', // Path to the Mac icon file
        mac: true, // We want to build it for mac
        win: false, // We want to build it for win
        linux32: false, // We don't need linux32
        linux64: false, // We don't need linux64
      },
      src: './src/**/*' // Your node-webkit app
    },
    shell: {
      open: {
        command: 'open ./build/releases/<%= pkg.name %>/mac/<%= pkg.name %>.app'
      }
    }
  });
  grunt.loadNpmTasks('grunt-node-webkit-builder');
  grunt.loadNpmTasks('grunt-shell');
  grunt.registerTask('default', ['nodewebkit','shell']);
};

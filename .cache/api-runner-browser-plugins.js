module.exports = [{
      plugin: require('../node_modules/gatsby-plugin-mdx/gatsby-browser.js'),
      options: {"plugins":[],"extensions":[".mdx",".md"],"gatsbyRemarkPlugins":[{"resolve":"gatsby-remark-embed-spotify","options":{"width":400,"height":400}},{"resolve":"gatsby-remark-embed-soundcloud","options":{"width":400,"height":400}},{"resolve":"gatsby-remark-images","options":{"maxWidth":1440,"linkImagesToOriginal":false,"quality":90,"withWebP":true,"sizeByPixelDensity":true}}]},
    },{
      plugin: require('../node_modules/gatsby-plugin-theme-ui/gatsby-browser.js'),
      options: {"plugins":[]},
    },{
      plugin: require('../node_modules/gatsby-plugin-offline/gatsby-browser.js'),
      options: {"plugins":[]},
    }]

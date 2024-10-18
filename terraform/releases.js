'use strict';

function getDistributables(request) {
  return request({
    url: 'https://releases.hashicorp.com/terraform/index.json',
    json: true,
  }).then(function (resp) {
    let releases = resp.body;
    let all = {
      releases: [],
      download: '', // Full URI provided in response body
    };

    function getBuildsForVersion(version) {
      releases.versions[version].builds.forEach(function (build) {
        let r = {
          version: build.version,
          download: build.url,
          // These are generic enough for the autodetect,
          // and the per-file logic has proven to get outdated sooner
          //os: convert[build.os],
          //arch: convert[build.arch],
          //channel: 'stable|-rc|-beta|-alpha',
        };
        all.releases.push(r);
      });
    }

    // Releases are listed chronologically, we want the latest first.
    const allVersions = Object.keys(releases.versions).reverse();

    allVersions.forEach(function (version) {
      getBuildsForVersion(version);
    });

    return all;
  });
}

module.exports = getDistributables;

if (module === require.main) {
  getDistributables(require('@root/request')).then(function (all) {
    all = require('../_webi/normalize.js')(all);
    console.info(JSON.stringify(all));
  });
}

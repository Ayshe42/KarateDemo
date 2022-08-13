function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
  env: env,
  myVarName: 'hello karate',
  baseUrl: 'https://gorest.co.in',
  tokenID: '688b936ef7aa9a7e7b7204a72ec05411822b0c1e005579ec4e61e96821216bcf'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
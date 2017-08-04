
'use strict'

module.exports = {
    name: 'API',
    version: '0.0.1',
    env: process.env.NODE_ENV || 'development',
    port: process.env.KUXKUXEROA_PORT || 3000,
    base_url: process.env.KUXKUXEROA_BASE_URL || 'http://localhost:3000',
    db: {
        uri: process.env.KUXKUXEROA_MONGODB_URI || 'mongodb://127.0.0.1:27017/kuxkuxeroa',
    },
}

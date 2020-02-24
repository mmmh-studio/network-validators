## Common
- The TCP or UNIX socket address for the RPC server to listen on:
`${rpc_laddr}` (default: `"tcp://0.0.0.0:26656"`)
- See [here](https://github.com/mmmh-studio/validator/pull/18#discussion_r381937336); I don' think this should be changed to the app name but to:
`"tcp://127.0.0.1:26658"`; variable: `${proxy_app}`
- `${moniker}`
- Database directory: `${db_dir}`(default: `data`)
- Config directory: `${config_dir}` (for: `genesis.json, priv_validator_key.json, addrbook.json`)
- Data directory: `${data_dir}`, contains the `wal_file` and `priv_validator_state.json` (default: `data`)
- TCP or UNIX socket address for the profiling server to listen on: `${prof_laddr}` (default: `localhost:6060`)
- `${seed_list}`:  Comma separated list of seed nodes to connect to; example that worked on the hub-3 mainnet:
`# seeds = "344e7c6cf62d26a635cc668e6dfbead96c7e0f43@52.57.29.196:26656,352bc356eabc1b908bef70cd6e644b6dd44923cb@35.158.255.161:26656,3e16af0cead27979e1fc3dac57d03df3c7a77acc@3.87.179.235:26656,ba3bacc714817218562f743178228f23678b2873@public-seed-node.cosmoshub.certus.one:26656,2626942148fd39830cb7a3acccb235fab0332d86@173.212.199.36:26656,3028c6ee9be21f0d34be3e97a59b093e15ec0658@91.205.173.168:26656,89e4b72625c0a13d6f62e3cd9d40bfc444cbfa77@34.65.6.52:26656"`
- `${p2p_laddr}`: Address to listen for incoming connections (default: tcp://0.0.0.0:26656)


## Sentry

| Variable | Setting|
|:---------:|:--------:|
| ${pex}               | true |
| ${persistent_peers}  | validator node, optionally other sentry nodes (nodeid@ip:port)|
| ${private_peer_ids}  | validator node id |

## Validator

| Option | Setting|
|:---------:|:--------:|
| ${pex}	           | false | 
| ${persistent_peers} | list of sentry nodes (nodeid@ip:port)|
| ${private_peer_ids} | omitted | 

## KMS

See annotation in the kms config.

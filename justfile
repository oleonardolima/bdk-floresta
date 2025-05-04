_default:
  @just --list

fmt:
  cargo +nightly fmt

check:
  cargo +nightly fmt -- --check
  cargo clippy -- -D warnings
  cargo check --all-features

example name="example":
  cargo run --example {{name}} --release

# Options: data-bitcoin, data-signet, lockfile
delete item="data":
  just _delete-{{item}}

_delete-data-bitcoin:
  rm -rf data/bitcoin

_delete-data-signet:
  rm -rf data/signet

_delete-lockfile:
  rm -f Cargo.lock

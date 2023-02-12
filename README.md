<!--
SPDX-FileCopyrightText: 2020-2023 Max Reznik <reznikmm@gmail.com>

SPDX-License-Identifier: MIT
-->

# fedora-ada-action

This action builds RPM for an Ada project on Fedora.

## Inputs

### `spec`

**Required** The path to `spec` file. Default `"rpm.spec"`.

## Outputs

### `RPM`

List of built RPMs separated by a colon (`:`).

## Example usage

```
    steps:
      - uses: actions/checkout@v3
        with:
          path: ada-pretty
      - uses: reznikmm/fedora-ada-action@v36
        with:
          spec: ada-pretty/packages/travis/ada-pretty.spec

```

or in [my repository](https://github.com/reznikmm/ada-pretty/)

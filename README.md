# Homebrew

## Formulae
Invoke either of the following commands if the formula is hosted at GitHub

```sh
$ brew install loicrouchon/symly/<formula>
```

Or

```sh
$ brew tap loicrouchon/symly
$ brew install <formula>
```

Invoke the following command if the formula is *not* hosted at GitHub

```sh
brew tap loicrouchon/homebrew-symly 
brew install <formula>
```

## Casks
Invoke either of the following commands if the cask is hosted at GitHub

```sh
$ brew install --cask loicrouchon/symly/<cask>
```

Or

```sh
$ brew tap loicrouchon/symly
$ brew install --cask <cask>
```

Invoke the following command if the cask is *not* hosted at GitHub

```sh
brew tap loicrouchon/homebrew-symly 
brew install --cask <formula>
```

If you get a dialog stating the cask is broken try installing with `--no-quarantine`.

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Adding new formula

Once a new formula has been added to the [./Formula](./Formula) directory, they can be tested with:

```shell
 brew install --build-from-source ./Formula/<FORMULA>.rb
```

Brew audit can also be performed with:

```shell
brew audit ./Formula/<FORMULA>.rb
```
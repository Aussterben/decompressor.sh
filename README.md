# decompressor.sh
Script creado en bash para pasar de bandit12 a bandit13 de forma automatizada (me basé en el de s4vitar)

Para ejecutar este script, es necesario tener previamente un archivo "data.gz" que se consigue mandando a local todo el hex del archivo "data" del bandit12.

Una vez te traigas a local todo el output del archivo "data" del bandit12, ejecutas esto

```bash
cat data | xxd -r | sponge data; mv data data.gz
```


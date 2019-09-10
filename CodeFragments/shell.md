# Useful Shell codes

1. Convert gif to pdf
   ```shell
   #!/bin/bash
   for i in {001..112}; do
       convert $i.gif $i.pdf
   done
   ```

1. Shell for loop
   ```shell
   for i in {001..112}; do
       wget www.ab.ust.hk/hseo/training/elect/slide/$i.gif
   done
   ```

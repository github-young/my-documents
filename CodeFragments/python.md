# Useful Python codes

1. Draw a horizontal or vertical line
   ```python
   pl.axvline(0,color='k',linestyle='--')
   ```

1. Use PIL to make gif animation
   ```python
   from PIL import Image
   images=[]
   for i in range(25):
       im=Image.open(str(i)+".png")
       images.append(im)
   im.save('out.gif', save_all=True, append_images=images,loop=1,duration=1,comment=b"aaabb")
   ```

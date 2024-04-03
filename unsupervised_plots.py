#combining the plots of unsupervised analysis
#Author - Muthukumaraswami Sivaswami (1833616)

import matplotlib.pyplot as plt
import matplotlib.image as mpimg

#Loading the images
img1 = mpimg.imread('pca_log2FPKM.png')
img2 = mpimg.imread('kmeans_log2FPKM.png')
img3 = mpimg.imread('tsne2.png')

#Creating a figure and a set of subplots
fig, axs = plt.subplots(1, 3, figsize=(15, 5))

#Removing axes
for ax in axs:
    ax.axis('off')

#Plotting the images
axs[0].imshow(img1)
axs[0].text(0.5, -0.1, 'A', size=12, ha='center', transform=axs[0].transAxes, weight='bold')
axs[1].imshow(img2)
axs[1].text(0.5, -0.1, 'B', size=12, ha='center', transform=axs[1].transAxes, weight='bold')
axs[2].imshow(img3)
axs[2].text(0.5, -0.1, 'C', size=12, ha='center', transform=axs[2].transAxes, weight='bold')

#Adjusting spacing between subplots
plt.subplots_adjust(wspace=0.1)

#Saving the plot
plt.savefig('gridplot_labels.png')

plt.tight_layout()
plt.show()
#combining the plots of unsupervised analysis
#Author - Muthukumaraswami Sivaswami (1833616)

import matplotlib.pyplot as plt
import matplotlib.image as mpimg

#Loading the images
img1 = mpimg.imread('pca_log2FPKM.png')
img2 = mpimg.imread('kmeans_log2FPKM.png')
img3 = mpimg.imread('tsne2.png')
img4 = mpimg.imread('pca_microarray.jpeg')

#Creating a figure and a set of subplots
fig, axs = plt.subplots(2, 2, figsize=(10, 10))

#Removing axes
for ax_row in axs:
    for ax in ax_row:
        ax.axis('off')

#Plotting the images
axs[0, 0].imshow(img1)
axs[0, 0].text(0.5, -0.1, 'A', size=12, ha='center', transform=axs[0, 0].transAxes, weight='bold')
axs[0, 1].imshow(img2)
axs[0, 1].text(0.5, -0.1, 'B', size=12, ha='center', transform=axs[0, 1].transAxes, weight='bold')
axs[1, 0].imshow(img3)
axs[1, 0].text(0.5, -0.1, 'C', size=12, ha='center', transform=axs[1, 0].transAxes, weight='bold')
axs[1, 1].imshow(img4)
axs[1, 1].text(0.5, -0.1, 'D', size=12, ha='center', transform=axs[1, 1].transAxes, weight='bold')

#Adjusting spacing between subplots
plt.subplots_adjust(wspace=0.01, hspace=0.01)

#Saving the plot
plt.savefig('2x2_gridplot_labels_final.png')

plt.tight_layout()
plt.show()
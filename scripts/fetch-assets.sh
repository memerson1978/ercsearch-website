#!/bin/sh
# Copies the logo, photographs, client logos and privacy policy from the current ERC Search site
# into this repository, keeping the same file paths, so the pages can find them.
# Run from anywhere: sh scripts/fetch-assets.sh
set -e
cd "$(dirname "$0")/.."
BASE="https://www.ercsearch.com"
for f in img/erc-logo.png img/head/home1.jpg img/head/home2.jpg img/head/home3.jpg img/head/about.jpg img/head/clients.jpg img/head/candidates.jpg img/head/contact.jpg img/head/sectors.jpg img/sectors/finance.jpg img/sectors/retail.jpg img/sectors/private.jpg img/sectors/healthcare.jpg img/_image-2.jpg img/_image-1.jpg img/_image-3.jpg img/_image-4.jpg uploads/testimonials/lowcarbon.jpg uploads/testimonials/gocardless.jpeg uploads/testimonials/hiber.png uploads/testimonials/swoon.jpg uploads/testimonials/ct.png uploads/testimonials/farfetch-21-03-2017-12-22.jpg uploads/testimonials/zipcar-21-03-2017-12-06.jpg uploads/testimonials/amazon-21-03-2017-12-05.jpg uploads/testimonials/tandem-21-03-2017-12-05.jpg uploads/testimonials/merlin-21-03-2017-12-06.jpg uploads/testimonials/carnallfarrar-21-03-2017-12-07.jpg uploads/testimonials/lloyds-21-03-2017-12-22.jpg uploads/testimonials/amazon-21-03-2017-12-26.jpg uploads/testimonials/telegraph-21-03-2017-12-27.jpg uploads/testimonials/nhs.png uploads/150472117433-06-09-2017-19-06.png uploads/16034432516278-23-10-2020-09-54.jpg uploads/screen-shot-2017-03-21-at-12-00-37-21-03-2017-12-02.png privacy-policy.pdf; do
  mkdir -p "$(dirname "$f")"
  echo "Downloading $f"
  curl -fsSL -o "$f" "$BASE/$f"
done
mkdir -p img/sectors img/clients
# Sector photos from Unsplash (free under the Unsplash Licence)
echo "Downloading img/sectors/technology.jpg"
curl -fsSL -o "img/sectors/technology.jpg" "https://images.unsplash.com/photo-1792419766010-a562c6622ec0?w=900&h=660&fit=crop&q=80&fm=jpg"
echo "Downloading img/sectors/luxury-wellness.jpg"
curl -fsSL -o "img/sectors/luxury-wellness.jpg" "https://images.unsplash.com/photo-1488345979593-09db0f85545f?w=900&h=660&fit=crop&q=80&fm=jpg"
# Client logos from their owners' websites
echo "Downloading img/clients/rcs-england.png"
curl -fsSL -A "Mozilla/5.0" -o "img/clients/rcs-england.png" "https://www.rcseng.ac.uk/-/media/Images/RCS/System/royal-college-of-surgeons-of-england-logo-v2-transparent.png?h=186&w=438&la=en&hash=A118A418DB1EF248B30DFE97E32CDDAF" || echo "Could not download img/clients/rcs-england.png"
echo "Downloading img/clients/yum.svg"
curl -fsSL -A "Mozilla/5.0" -o "img/clients/yum.svg" "https://upload.wikimedia.org/wikipedia/commons/5/59/Yum%21_Brands_logo.svg" || echo "Could not download img/clients/yum.svg"
echo "Downloading img/clients/mind.png"
curl -fsSL -A "Mozilla/5.0" -o "img/clients/mind.png" "https://www.mind.org.uk/assets/images/Mind_Squiggle_Wordmark_Blue_RGB.png" || echo "Could not download img/clients/mind.png"
echo "Done."

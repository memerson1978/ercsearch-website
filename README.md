# ERC Search website

The ERC Search website as a static site: plain HTML, one stylesheet and one small script, with no build step. It keeps the existing logo, photographs, client logos, colours, typeface and wording, with an updated layout.

## Pages

| File | Page | Address on the current site |
| --- | --- | --- |
| index.html | Home | / |
| about.html | About Us | /about |
| directors.html | Meet our Team | /directors |
| careers.html | Careers | /careers |
| clients.html | Clients | /clients |
| candidates.html | Candidates | /candidates |
| sectors.html | Sectors | /sectors |
| contact.html | Contact Us | /contact |

GitHub Pages serves `about.html` at `/about`, so existing links and search results keep working.

## Before going live

1. **Images and privacy policy.** The logo, photographs, client logos and privacy policy are not in the repository yet. From the repository folder, run:

   ```
   sh scripts/fetch-assets.sh
   ```

   This downloads all 38 files from the current site into the same folders they use there (`img/` and `uploads/`), so nothing in the pages needs changing.

2. **Enquiry form.** As it stands, Submit opens the visitor's email program with a message addressed to info@ercsearch.co.uk. To receive submissions directly instead, create a form with a service such as Formspree and add its address to the form tag in `contact.html`, for example `action="https://formspree.io/f/your-id"`.

3. **Hosting on GitHub Pages.** In the repository, open Settings, then Pages, and deploy from the `main` branch, root folder. To use www.ercsearch.co.uk, add it as the custom domain there and update the DNS records at your domain provider, following GitHub's guide: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site

## Structure

```
assets/css/fonts.css     Asap, self hosted (SIL Open Font Licence, see assets/fonts)
assets/css/style.css     all styles; colours are set once at the top
assets/js/main.js        mobile menu, home page slider, back to top button, enquiry form
img/, uploads/           existing site images (added by scripts/fetch-assets.sh)
scripts/fetch-assets.sh  copies the images and privacy policy from the current site
```

The header and footer are repeated on every page. If you change a menu item, the phone number or the address, change it in all eight files.

## Image credits

The Telecoms, Media & Technology and Luxury & Wellness photos are free to use under the Unsplash Licence (https://unsplash.com/license). Credit is not required but is appreciated:

* Telecoms, Media & Technology: photo by Brecht Corbeel on Unsplash, https://unsplash.com/photos/green-fiber-optic-cable-with-connectors-al1DNjs29is
* Luxury & Wellness: photo by Alex Bertha on Unsplash, https://unsplash.com/photos/woman-in-water-pool-Jyg7xHRmXiU

## Client logos

The homepage reels show the four original logo strips (img/_image-1.jpg to _image-4.jpg) with these added logos in img/clients: Chanel, Depop, The Fold, Antidote, Yum! Brands, Carwow, Nested, The Royal College of Surgeons of England, Ennismore. Each was taken from the company's own website, except Yum! Brands (Wikimedia Commons, public domain). The Royal College of Surgeons of England and Yum! Brands logos are downloaded by scripts/fetch-assets.sh. To add another, put the file in img/clients and add a line to REEL_LOGOS in the build script.

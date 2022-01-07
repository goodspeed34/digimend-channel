(define-module (gs digimend)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build utils)
  #:use-module (guix build-system linux-module)
  #:use-module (guix build-system copy)
  #:export (gs digimend))


(define-public digimend-linux-module
  (package
   (name "digimend-linux-module")
   (version "10.0.4")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://github.com/goodspeed34/digimend-kernel-drivers/archive/refs/tags/v" version ".tar.gz"))
     (sha256
      (base32 "14ib0yhm0bcrbjlk0qvjl4ma4jy3nnighd5a4pkhbl4826dyfdw1"))))
   (build-system linux-module-build-system)
   (arguments
    `(#:tests? #f)) ; No test avaiable
   (home-page "https://github.com/goodspeed34")
   (synopsis "DIGImend graphics tablet drivers for the Linux kernel")
   (description
    "This is a collection of graphics tablet drivers for the Linux kernel, produced and maintained by the DIGImend project. We maintain this package to provide newer drivers for older kernel versions which don't have them, and to allow users to test new drivers before we contribute them to the mainline kernel.")
   (license license:gpl2+)))

(define-public digimend-udev-rules
  (package
   (name "digimend-udev-rules")
   (version "10.0.4")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://github.com/goodspeed34/digimend-kernel-drivers/archive/refs/tags/v" version ".tar.gz"))
     (sha256
      (base32 "14ib0yhm0bcrbjlk0qvjl4ma4jy3nnighd5a4pkhbl4826dyfdw1"))))
   (build-system copy-build-system)
   (arguments
    '(#:install-plan
      '(("./udev.rules" "lib/udev/rules.d/90-digimend.rules")
	("./hid-rebind", "lib/udev/hid-rebind"))))
   (synopsis "DIGImend graphics tablet drivers for the Linux kernel")
   (description
    "This is a collection of graphics tablet drivers for the Linux kernel, produced and maintained by the DIGImend project. We maintain this package to provide newer drivers for older kernel versions which don't have them, and to allow users to test new drivers before we contribute them to the mainline kernel.")
   (license license:gpl2+)))

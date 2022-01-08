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
   (version "10")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://github.com/DIGImend/digimend-kernel-drivers/archive/refs/tags/v" version ".tar.gz"))
     (sha256
      (base32 "0ll1x7a2s9258smn4zgy5jliwf37wl7xzpwm10mb3hdjcqpiwk1z"))))
   (build-system linux-module-build-system)
   (arguments
    `(#:tests? #f)) ; No test avaiable
   (home-page "https://github.com/DIGImend")
   (synopsis "DIGImend graphics tablet drivers for the Linux kernel")
   (description
    "This is a collection of graphics tablet drivers for the Linux kernel, produced and maintained by the DIGImend project. We maintain this package to provide newer drivers for older kernel versions which don't have them, and to allow users to test new drivers before we contribute them to the mainline kernel.")
   (license license:gpl2+)))

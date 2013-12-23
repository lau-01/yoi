(in-package #:ws.ikki.yoi)


(defun encrypt-password (password)
  "This function encrypt with md5 digest a string that represents a password
   IN: password as string.
   OUT: encrypted password."
  (let ((algorithm nil)
        (bin-data  nil)
	(vector    nil))
    (when (typep password 'string)
      ;; set algorithm md5
      (setf algorithm (ironclad:make-digest 'ironclad:md5))
      ;; convert the password string to byte-array to use in digest
      (setf bin-data (ironclad:ascii-string-to-byte-array password))
      ;;update the disgest with our algorithm and  bin-data
      (ironclad:update-digest algorithm bin-data)
      ;;generate the vector by produce-digest with algorithm used
      (setf vector (ironclad:produce-digest algorithm))
      ;; convert each item of vector by  hexadecimal value string
      ;; in other words we get the encrypt password
      (ironclad:byte-array-to-hex-string vector))))

(Defun Hash-password (password)
  "This function hash with sha256 digest a password that represents a password
   IN: password as string
   OUT: hashed password"
  (when (typep password 'string)
    (ironclad:byte-array-to-hex-string 
     (ironclad:digest-sequence
      :sha256
      (ironclad:ascii-string-to-byte-array password)))))
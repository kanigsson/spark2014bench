(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort unsigned_byte 0)

(declare-fun unsigned_byteqtint (unsigned_byte) Int)

;; unsigned_byte'axiom
  (assert
  (forall ((i unsigned_byte))
  (and (<= 0 (unsigned_byteqtint i)) (<= (unsigned_byteqtint i) 255))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (unsigned_byte unsigned_byte) Bool)

(declare-const dummy1 unsigned_byte)

(declare-datatypes ()
((unsigned_byte__ref
 (unsigned_byte__refqtmk (unsigned_byte__content unsigned_byte)))))
(define-fun unsigned_byte__ref_unsigned_byte__content__projection ((a1 unsigned_byte__ref)) unsigned_byte 
  (unsigned_byte__content a1))

(define-fun dynamic_invariant1 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 255)) (in_range2 temp___expr_178)))

(declare-sort tunsigned_byteB 0)

(declare-fun tunsigned_byteBqtint (tunsigned_byteB) Int)

;; tunsigned_byteB'axiom
  (assert
  (forall ((i tunsigned_byteB))
  (and (<= (- 32768) (tunsigned_byteBqtint i))
  (<= (tunsigned_byteBqtint i) 32767))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tunsigned_byteB tunsigned_byteB) Bool)

(declare-const dummy2 tunsigned_byteB)

(declare-datatypes ()
((tunsigned_byteB__ref
 (tunsigned_byteB__refqtmk (tunsigned_byteB__content tunsigned_byteB)))))
(define-fun tunsigned_byteB__ref_tunsigned_byteB__content__projection ((a1 tunsigned_byteB__ref)) tunsigned_byteB 
  (tunsigned_byteB__content a1))

(define-fun to_rep ((x tunsigned_byteB)) Int (tunsigned_byteBqtint x))

(declare-fun of_rep (Int) tunsigned_byteB)

;; inversion_axiom
  (assert
  (forall ((x tunsigned_byteB))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tunsigned_byteB)) (! (in_range3
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tunsigned_byteB tunsigned_byteB) Bool)

(declare-const dummy3 tunsigned_byteB)

(declare-datatypes ()
((t9b__ref (t9b__refqtmk (t9b__content tunsigned_byteB)))))
(define-fun t9b__ref_t9b__content__projection ((a1 t9b__ref)) tunsigned_byteB 
  (t9b__content a1))

(declare-const r Int)

;; Assume
  (assert (dynamic_invariant1 a true false true true))

;; Assume
  (assert (dynamic_invariant1 b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant r false false true true))

(declare-const r1 Int)

;; H
  (assert (= r1 0))

;; H
  (assert (<= 1 b))

(assert
;; defqtvc
 ;; File "arithmetic.adb", line 27, characters 0-0
  (not (<= 0 1)))
(check-sat)

(exit)

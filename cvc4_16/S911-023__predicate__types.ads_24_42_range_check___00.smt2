(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-const index Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (index_type index_type) Bool)

(declare-const dummy index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 2147483647)) (in_range
                                     temp___expr_177)))

(declare-sort tbit_length_typeB 0)

(declare-fun tbit_length_typeBqtint (tbit_length_typeB) Int)

;; tbit_length_typeB'axiom
  (assert
  (forall ((i tbit_length_typeB))
  (and (<= (- 9223372036854775808) (tbit_length_typeBqtint i))
  (<= (tbit_length_typeBqtint i) 9223372036854775807))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tbit_length_typeB tbit_length_typeB) Bool)

(declare-const dummy1 tbit_length_typeB)

(declare-datatypes ((tbit_length_typeB__ref 0))
(((tbit_length_typeB__refqtmk (tbit_length_typeB__content tbit_length_typeB)))))
(define-fun tbit_length_typeB__ref_tbit_length_typeB__content__projection ((a tbit_length_typeB__ref)) tbit_length_typeB 
  (tbit_length_typeB__content a))

(declare-sort bit_index_type 0)

(declare-fun bit_index_typeqtint (bit_index_type) Int)

;; bit_index_type'axiom
  (assert
  (forall ((i bit_index_type))
  (and (<= 1 (bit_index_typeqtint i))
  (<= (bit_index_typeqtint i) 17179869176))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 17179869176)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (bit_index_type bit_index_type) Bool)

(declare-const dummy2 bit_index_type)

(declare-datatypes ((bit_index_type__ref 0))
(((bit_index_type__refqtmk (bit_index_type__content bit_index_type)))))
(define-fun bit_index_type__ref_bit_index_type__content__projection ((a bit_index_type__ref)) bit_index_type 
  (bit_index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 1 17179869176)) (in_range2
                                     temp___expr_191)))

(assert
;; defqtvc
 ;; File "types.ads", line 23, characters 0-0
  (not
  (=> (dynamic_invariant index true false true true)
  (let ((o (* (- index 1) 8)))
  (=> (in_range1 o) (let ((o1 (+ o 8))) (=> (in_range1 o1) (in_range2 o1))))))))
(check-sat)
(exit)

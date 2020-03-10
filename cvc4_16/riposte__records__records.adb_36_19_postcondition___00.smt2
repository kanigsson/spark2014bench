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

(declare-sort unsigned_byte 0)

(declare-fun unsigned_byteqtint (unsigned_byte) Int)

;; unsigned_byte'axiom
  (assert
  (forall ((i unsigned_byte))
  (and (<= 0 (unsigned_byteqtint i)) (<= (unsigned_byteqtint i) 255))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (unsigned_byte unsigned_byte) Bool)

(declare-const dummy unsigned_byte)

(declare-datatypes ((unsigned_byte__ref 0))
(((unsigned_byte__refqtmk (unsigned_byte__content unsigned_byte)))))
(define-fun unsigned_byte__ref_unsigned_byte__content__projection ((a unsigned_byte__ref)) unsigned_byte 
  (unsigned_byte__content a))

(define-fun to_rep ((x unsigned_byte)) Int (unsigned_byteqtint x))

(declare-fun of_rep (Int) unsigned_byte)

;; inversion_axiom
  (assert
  (forall ((x unsigned_byte))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x unsigned_byte)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__records_prooffuncs__pair__a unsigned_byte)(rec__records_prooffuncs__pair__b unsigned_byte)))))
(define-fun us_split_fields_rec__records_prooffuncs__pair__a__projection ((a us_split_fields)) unsigned_byte 
  (rec__records_prooffuncs__pair__a a))

(define-fun us_split_fields_rec__records_prooffuncs__pair__b__projection ((a us_split_fields)) unsigned_byte 
  (rec__records_prooffuncs__pair__b a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__records_prooffuncs__pair__a
                           (us_split_fields1 a))) (to_rep
                                                  (rec__records_prooffuncs__pair__a
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__records_prooffuncs__pair__b
                           (us_split_fields1 a))) (to_rep
                                                  (rec__records_prooffuncs__pair__b
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const records_prooffuncs__pair__a__first__bit Int)

(declare-const records_prooffuncs__pair__a__last__bit Int)

(declare-const records_prooffuncs__pair__a__position Int)

;; records_prooffuncs__pair__a__first__bit_axiom
  (assert (<= 0 records_prooffuncs__pair__a__first__bit))

;; records_prooffuncs__pair__a__last__bit_axiom
  (assert
  (< records_prooffuncs__pair__a__first__bit records_prooffuncs__pair__a__last__bit))

;; records_prooffuncs__pair__a__position_axiom
  (assert (<= 0 records_prooffuncs__pair__a__position))

(declare-const records_prooffuncs__pair__b__first__bit Int)

(declare-const records_prooffuncs__pair__b__last__bit Int)

(declare-const records_prooffuncs__pair__b__position Int)

;; records_prooffuncs__pair__b__first__bit_axiom
  (assert (<= 0 records_prooffuncs__pair__b__first__bit))

;; records_prooffuncs__pair__b__last__bit_axiom
  (assert
  (< records_prooffuncs__pair__b__first__bit records_prooffuncs__pair__b__last__bit))

;; records_prooffuncs__pair__b__position_axiom
  (assert (<= 0 records_prooffuncs__pair__b__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((pair__ref 0))
(((pair__refqtmk (pair__content us_rep)))))
(define-fun pair__ref_pair__content__projection ((a pair__ref)) us_rep 
  (pair__content a))

(declare-const null_pair us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 0 255)) (in_range temp___expr_180)))

(declare-const rliteral unsigned_byte)

;; rliteral_axiom
  (assert (= (unsigned_byteqtint rliteral) 0))

;; null_pair__def_axiom
  (assert (= null_pair (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))

(assert
;; defqtvc
 ;; File "records.adb", line 35, characters 0-0
  (not
  (forall ((r__split_fields us_split_fields)
  (records__init_d__result us_split_fields))
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral)) null_pair)
  (=> (= r__split_fields (us_split_fields1 null_pair))
  (=> (= records__init_d__result r__split_fields)
  (= (bool_eq (us_repqtmk records__init_d__result) null_pair) true)))))))
(check-sat)
(exit)

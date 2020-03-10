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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__thing__d natural)))))
(define-fun us_split_discrs_rec__foo__thing__d__projection ((a us_split_discrs)) natural 
  (rec__foo__thing__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__thing__a Bool)(rec__foo__thing__x Bool)))))
(define-fun us_split_fields_rec__foo__thing__a__projection ((a us_split_fields)) Bool 
  (rec__foo__thing__a a))

(define-fun us_split_fields_rec__foo__thing__x__projection ((a us_split_fields)) Bool 
  (rec__foo__thing__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun in_range2 ((rec__foo__thing__d1 Int)
  (a us_split_discrs)) Bool (= rec__foo__thing__d1 (to_rep
                                                   (rec__foo__thing__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const foo__thing__d__first__bit Int)

(declare-const foo__thing__d__last__bit Int)

(declare-const foo__thing__d__position Int)

;; foo__thing__d__first__bit_axiom
  (assert (<= 0 foo__thing__d__first__bit))

;; foo__thing__d__last__bit_axiom
  (assert (< foo__thing__d__first__bit foo__thing__d__last__bit))

;; foo__thing__d__position_axiom
  (assert (<= 0 foo__thing__d__position))

(declare-const foo__thing__a__first__bit Int)

(declare-const foo__thing__a__last__bit Int)

(declare-const foo__thing__a__position Int)

;; foo__thing__a__first__bit_axiom
  (assert (<= 0 foo__thing__a__first__bit))

;; foo__thing__a__last__bit_axiom
  (assert (< foo__thing__a__first__bit foo__thing__a__last__bit))

;; foo__thing__a__position_axiom
  (assert (<= 0 foo__thing__a__position))

(declare-const foo__thing__x__first__bit Int)

(declare-const foo__thing__x__last__bit Int)

(declare-const foo__thing__x__position Int)

;; foo__thing__x__first__bit_axiom
  (assert (<= 0 foo__thing__x__first__bit))

;; foo__thing__x__last__bit_axiom
  (assert (< foo__thing__x__first__bit foo__thing__x__last__bit))

;; foo__thing__x__position_axiom
  (assert (<= 0 foo__thing__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((thing__ref 0))
(((thing__refqtmk (thing__content us_rep)))))
(define-fun thing__ref_thing__content__projection ((a thing__ref)) us_rep 
  (thing__content a))

(assert
;; defqtvc
 ;; File "foo.adb", line 13, characters 0-0
  (not
  (forall ((b Bool) (self__ us_rep))
  (=> (dynamic_invariant n true false true true)
  (=> (< 10 n)
  (=> (= b true)
  (=> (= (rec__foo__thing__a (us_split_fields1 self__)) true) (= b true))))))))
(check-sat)
(exit)

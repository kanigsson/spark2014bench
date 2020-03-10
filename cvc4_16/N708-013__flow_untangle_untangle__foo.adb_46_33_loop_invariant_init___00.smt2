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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__foo__r__x integer)(rec__foo__r__y integer)(rec__foo__r__z integer)))))
(define-fun us_split_fields_rec__foo__r__x__projection ((a us_split_fields)) integer 
  (rec__foo__r__x a))

(define-fun us_split_fields_rec__foo__r__y__projection ((a us_split_fields)) integer 
  (rec__foo__r__y a))

(define-fun us_split_fields_rec__foo__r__z__projection ((a us_split_fields)) integer 
  (rec__foo__r__z a))

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
                        (and
                        (= (to_rep (rec__foo__r__x (us_split_fields1 a))) 
                        (to_rep (rec__foo__r__x (us_split_fields1 b))))
                        (= (to_rep (rec__foo__r__y (us_split_fields1 a))) 
                        (to_rep (rec__foo__r__y (us_split_fields1 b)))))
                        (= (to_rep (rec__foo__r__z (us_split_fields1 a))) 
                        (to_rep (rec__foo__r__z (us_split_fields1 b)))))
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

(declare-const foo__r__x__first__bit Int)

(declare-const foo__r__x__last__bit Int)

(declare-const foo__r__x__position Int)

;; foo__r__x__first__bit_axiom
  (assert (<= 0 foo__r__x__first__bit))

;; foo__r__x__last__bit_axiom
  (assert (< foo__r__x__first__bit foo__r__x__last__bit))

;; foo__r__x__position_axiom
  (assert (<= 0 foo__r__x__position))

(declare-const foo__r__y__first__bit Int)

(declare-const foo__r__y__last__bit Int)

(declare-const foo__r__y__position Int)

;; foo__r__y__first__bit_axiom
  (assert (<= 0 foo__r__y__first__bit))

;; foo__r__y__last__bit_axiom
  (assert (< foo__r__y__first__bit foo__r__y__last__bit))

;; foo__r__y__position_axiom
  (assert (<= 0 foo__r__y__position))

(declare-const foo__r__z__first__bit Int)

(declare-const foo__r__z__last__bit Int)

(declare-const foo__r__z__position Int)

;; foo__r__z__first__bit_axiom
  (assert (<= 0 foo__r__z__first__bit))

;; foo__r__z__last__bit_axiom
  (assert (< foo__r__z__first__bit foo__r__z__last__bit))

;; foo__r__z__position_axiom
  (assert (<= 0 foo__r__z__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort t6b 0)

(declare-fun t6bqtint (t6b) Int)

;; t6b'axiom
  (assert (forall ((i t6b)) (and (<= 1 (t6bqtint i)) (<= (t6bqtint i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t6b t6b) Bool)

(declare-const dummy2 t6b)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content t6b)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) t6b (t6b__content
                                                                 a))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "foo.adb", line 38, characters 0-0
  (not
  (forall ((o integer) (o1 integer) (tmp__split_fields us_split_fields)
  (i Int) (temp___loop_entry_237 us_split_fields))
  (=> (dynamic_invariant n true false true true)
  (=> (= (to_rep o) n)
  (=> (= (to_rep o1) n)
  (=> (= tmp__split_fields (us_split_fieldsqtmk o1 o rliteral))
  (=> (= i 1)
  (=> (= (and (ite (<= 1 i) true false) (ite (<= i 3) true false)) true)
  (=> (= temp___loop_entry_237 tmp__split_fields)
  (forall ((o2 Int))
  (=> (= (to_rep (rec__foo__r__y tmp__split_fields)) o2)
  (let ((o3 (+ o2 1)))
  (=> (in_range1 o3)
  (forall ((o4 integer))
  (=> (= (to_rep o4) o3)
  (forall ((tmp__split_fields1 us_split_fields))
  (=>
  (= tmp__split_fields1 (us_split_fieldsqtmk
                        (rec__foo__r__x tmp__split_fields) o4
                        (rec__foo__r__z tmp__split_fields)))
  (forall ((o5 Int))
  (=> (= (to_rep (rec__foo__r__x temp___loop_entry_237)) o5)
  (= (to_rep (rec__foo__r__x tmp__split_fields)) (to_rep
                                                 (rec__foo__r__x
                                                 temp___loop_entry_237)))))))))))))))))))))))
(check-sat)
(exit)

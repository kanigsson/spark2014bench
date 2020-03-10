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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__prot__p_int__d integer)))))
(define-fun us_split_discrs_rec__prot__p_int__d__projection ((a us_split_discrs)) integer 
  (rec__prot__p_int__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__prot__p_int__the_protected_int integer)(rec__prot__p_int__condition Bool)))))
(define-fun us_split_fields_rec__prot__p_int__the_protected_int__projection ((a us_split_fields)) integer 
  (rec__prot__p_int__the_protected_int a))

(define-fun us_split_fields_rec__prot__p_int__condition__projection ((a us_split_fields)) Bool 
  (rec__prot__p_int__condition a))

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

(define-fun in_range1 ((rec__prot__p_int__d1 Int)
  (a us_split_discrs)) Bool (= rec__prot__p_int__d1 (to_rep
                                                    (rec__prot__p_int__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const prot__p_int__d__first__bit Int)

(declare-const prot__p_int__d__last__bit Int)

(declare-const prot__p_int__d__position Int)

;; prot__p_int__d__first__bit_axiom
  (assert (<= 0 prot__p_int__d__first__bit))

;; prot__p_int__d__last__bit_axiom
  (assert (< prot__p_int__d__first__bit prot__p_int__d__last__bit))

;; prot__p_int__d__position_axiom
  (assert (<= 0 prot__p_int__d__position))

(declare-const prot__p_int__the_protected_int__first__bit Int)

(declare-const prot__p_int__the_protected_int__last__bit Int)

(declare-const prot__p_int__the_protected_int__position Int)

;; prot__p_int__the_protected_int__first__bit_axiom
  (assert (<= 0 prot__p_int__the_protected_int__first__bit))

;; prot__p_int__the_protected_int__last__bit_axiom
  (assert
  (< prot__p_int__the_protected_int__first__bit prot__p_int__the_protected_int__last__bit))

;; prot__p_int__the_protected_int__position_axiom
  (assert (<= 0 prot__p_int__the_protected_int__position))

(declare-const prot__p_int__condition__first__bit Int)

(declare-const prot__p_int__condition__last__bit Int)

(declare-const prot__p_int__condition__position Int)

;; prot__p_int__condition__first__bit_axiom
  (assert (<= 0 prot__p_int__condition__first__bit))

;; prot__p_int__condition__last__bit_axiom
  (assert
  (< prot__p_int__condition__first__bit prot__p_int__condition__last__bit))

;; prot__p_int__condition__position_axiom
  (assert (<= 0 prot__p_int__condition__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((p_int__ref 0))
(((p_int__refqtmk (p_int__content us_rep)))))
(define-fun p_int__ref_p_int__content__projection ((a p_int__ref)) us_rep 
  (p_int__content a))

(assert
;; defqtvc
 ;; File "prot.ads", line 10, characters 0-0
  (not
  (forall ((visible Int) (self__ us_rep) (o Int))
  (=> (dynamic_invariant visible true false true true)
  (=> (dynamic_invariant x true false true true)
  (=>
  (= (to_rep (rec__prot__p_int__the_protected_int (us_split_fields1 self__))) o)
  (let ((o1 (+ o visible))) (=> (in_range o1) (in_range (+ o1 x))))))))))
(check-sat)
(exit)

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__active_prio__p_type__a integer)))))
(define-fun us_split_fields_rec__active_prio__p_type__a__projection ((a us_split_fields)) integer 
  (rec__active_prio__p_type__a a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const active_prio__p_type__a__first__bit Int)

(declare-const active_prio__p_type__a__last__bit Int)

(declare-const active_prio__p_type__a__position Int)

;; active_prio__p_type__a__first__bit_axiom
  (assert (<= 0 active_prio__p_type__a__first__bit))

;; active_prio__p_type__a__last__bit_axiom
  (assert
  (< active_prio__p_type__a__first__bit active_prio__p_type__a__last__bit))

;; active_prio__p_type__a__position_axiom
  (assert (<= 0 active_prio__p_type__a__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((p_type__ref 0))
(((p_type__refqtmk (p_type__content us_rep)))))
(define-fun p_type__ref_p_type__content__projection ((a p_type__ref)) us_rep 
  (p_type__content a))

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

(define-fun default_initial_assumption ((temp___expr_187 us_rep)
  (temp___skip_top_level_188 Bool)) Bool (= (to_rep
                                            (rec__active_prio__p_type__a
                                            (us_split_fields1
                                            temp___expr_187))) 0))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__active_prio__q_type__a integer)))))
(define-fun us_split_fields_rec__active_prio__q_type__a__projection ((a us_split_fields2)) integer 
  (rec__active_prio__q_type__a a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const active_prio__q_type__a__first__bit Int)

(declare-const active_prio__q_type__a__last__bit Int)

(declare-const active_prio__q_type__a__position Int)

;; active_prio__q_type__a__first__bit_axiom
  (assert (<= 0 active_prio__q_type__a__first__bit))

;; active_prio__q_type__a__last__bit_axiom
  (assert
  (< active_prio__q_type__a__first__bit active_prio__q_type__a__last__bit))

;; active_prio__q_type__a__position_axiom
  (assert (<= 0 active_prio__q_type__a__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((q_type__ref 0))
(((q_type__refqtmk (q_type__content us_rep1)))))
(define-fun q_type__ref_q_type__content__projection ((a q_type__ref)) us_rep1 
  (q_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption1 ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep
                                            (rec__active_prio__q_type__a
                                            (us_split_fields3
                                            temp___expr_194))) 0))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort priority 0)

(declare-fun priorityqtint (priority) Int)

;; priority'axiom
  (assert
  (forall ((i priority))
  (and (<= 0 (priorityqtint i)) (<= (priorityqtint i) 97))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 97)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq3 (priority priority) Bool)

(declare-const dummy1 priority)

(declare-datatypes ((priority__ref 0))
(((priority__refqtmk (priority__content priority)))))
(define-fun priority__ref_priority__content__projection ((a priority__ref)) priority 
  (priority__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 97)) (in_range1 temp___expr_165)))

(assert
;; defqtvc
 ;; File "active_prio.ads", line 3, characters 0-0
  (not false))
(check-sat)
(exit)

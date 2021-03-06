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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__private_types__simple__d natural)))))
(define-fun us_split_discrs_rec__private_types__simple__d__projection ((a us_split_discrs)) natural 
  (rec__private_types__simple__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__private_types__simple us_main_type)))))
(define-fun us_split_fields_rec__private_types__simple__projection ((a us_split_fields)) us_main_type 
  (rec__private_types__simple a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__private_types__simple__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__private_types__simple__d
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__private_types__simple (us_split_fields1 a))
                           (rec__private_types__simple (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__private_types__simple__d1 Int)
  (a us_split_discrs)) Bool (= rec__private_types__simple__d1 (to_rep
                                                              (rec__private_types__simple__d
                                                              a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const private_types__simple__d__first__bit Int)

(declare-const private_types__simple__d__last__bit Int)

(declare-const private_types__simple__d__position Int)

;; private_types__simple__d__first__bit_axiom
  (assert (<= 0 private_types__simple__d__first__bit))

;; private_types__simple__d__last__bit_axiom
  (assert
  (< private_types__simple__d__first__bit private_types__simple__d__last__bit))

;; private_types__simple__d__position_axiom
  (assert (<= 0 private_types__simple__d__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((simple__ref (simple__refqtmk (simple__content us_rep)))))
(define-fun simple__ref_simple__content__projection ((a simple__ref)) us_rep 
  (simple__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__use_private_types__holder__content us_rep)))))
(define-fun us_split_fields_rec__use_private_types__holder__content__projection ((a us_split_fields2)) us_rep 
  (rec__use_private_types__holder__content a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (bool_eq
                            (rec__use_private_types__holder__content
                            (us_split_fields3 a))
                            (rec__use_private_types__holder__content
                            (us_split_fields3 b))) true)
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const use_private_types__holder__content__first__bit Int)

(declare-const use_private_types__holder__content__last__bit Int)

(declare-const use_private_types__holder__content__position Int)

;; use_private_types__holder__content__first__bit_axiom
  (assert (<= 0 use_private_types__holder__content__first__bit))

;; use_private_types__holder__content__last__bit_axiom
  (assert
  (< use_private_types__holder__content__first__bit use_private_types__holder__content__last__bit))

;; use_private_types__holder__content__position_axiom
  (assert (<= 0 use_private_types__holder__content__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((holder__ref (holder__refqtmk (holder__content us_rep1)))))
(define-fun holder__ref_holder__content__projection ((a holder__ref)) us_rep1 
  (holder__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_198 us_rep1)
  (temp___skip_top_level_199 Bool)) Bool (= (to_rep
                                            (rec__private_types__simple__d
                                            (us_split_discrs1
                                            (rec__use_private_types__holder__content
                                            (us_split_fields3
                                            temp___expr_198))))) 0))

(define-fun default_initial_assumption1 ((temp___expr_162 us_rep)
  (temp___skip_top_level_163 Bool)) Bool (= (to_rep
                                            (rec__private_types__simple__d
                                            (us_split_discrs1
                                            temp___expr_162))) 0))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const s__split_fields us_rep)

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "use_private_types.ads", line 19, characters 0-0
  (not true))
(check-sat)

(exit)

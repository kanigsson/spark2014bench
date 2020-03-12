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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

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

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__private_discr__p_with_default__c natural)))))
(define-fun us_split_discrs_rec__private_discr__p_with_default__c__projection ((a us_split_discrs)) natural 
  (rec__private_discr__p_with_default__c a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__6__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__private_discr__p_with_default us_main_type)))))
(define-fun us_split_fields_rec__private_discr__p_with_default__projection ((a us_split_fields)) us_main_type 
  (rec__private_discr__p_with_default a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__6__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__private_discr__p_with_default__c
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__private_discr__p_with_default__c
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__private_discr__p_with_default
                           (us_split_fields1 a))
                           (rec__private_discr__p_with_default
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__private_discr__p_with_default__c1 Int)
  (a us_split_discrs)) Bool (= rec__private_discr__p_with_default__c1 
  (to_rep (rec__private_discr__p_with_default__c a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const private_discr__p_with_default__c__first__bit Int)

(declare-const private_discr__p_with_default__c__last__bit Int)

(declare-const private_discr__p_with_default__c__position Int)

;; private_discr__p_with_default__c__first__bit_axiom
  (assert (<= 0 private_discr__p_with_default__c__first__bit))

;; private_discr__p_with_default__c__last__bit_axiom
  (assert
  (< private_discr__p_with_default__c__first__bit private_discr__p_with_default__c__last__bit))

;; private_discr__p_with_default__c__position_axiom
  (assert (<= 0 private_discr__p_with_default__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((p_with_default__ref
 (p_with_default__refqtmk (p_with_default__content us_rep)))))
(define-fun p_with_default__ref_p_with_default__content__projection ((a p_with_default__ref)) us_rep 
  (p_with_default__content a))

(declare-fun new_with_default (Int) us_rep)

(declare-fun new_with_default__function_guard (us_rep Int) Bool)

(define-fun default_initial_assumption ((temp___expr_250 us_rep)
  (temp___skip_top_level_251 Bool)) Bool (= (to_rep
                                            (rec__private_discr__p_with_default__c
                                            (us_split_discrs1
                                            temp___expr_250))) 0))

(declare-const d__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const private_discr__p_with_default__c__first__bit1 Int)

(declare-const private_discr__p_with_default__c__last__bit1 Int)

(declare-const private_discr__p_with_default__c__position1 Int)

;; private_discr__p_with_default__c__first__bit_axiom
  (assert (<= 0 private_discr__p_with_default__c__first__bit1))

;; private_discr__p_with_default__c__last__bit_axiom
  (assert
  (< private_discr__p_with_default__c__first__bit1 private_discr__p_with_default__c__last__bit1))

;; private_discr__p_with_default__c__position_axiom
  (assert (<= 0 private_discr__p_with_default__c__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((td1S__ref (td1S__refqtmk (td1S__content us_rep)))))
(define-fun td1S__ref_td1S__content__3__projection ((a td1S__ref)) us_rep 
  (td1S__content a))

(declare-const d1__split_discrs us_split_discrs)

(declare-const d1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_258 us_rep)
  (temp___is_init_254 Bool) (temp___skip_constant_255 Bool)
  (temp___do_toplevel_256 Bool)
  (temp___do_typ_inv_257 Bool)) Bool (=>
                                     (not (= temp___skip_constant_255 true))
                                     (in_range1 c
                                     (us_split_discrs1 temp___expr_258))))

(define-fun default_initial_assumption1 ((temp___expr_260 us_rep)
  (temp___skip_top_level_261 Bool)) Bool (= (to_rep
                                            (rec__private_discr__p_with_default__c
                                            (us_split_discrs1
                                            temp___expr_260))) c))

(declare-const d2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const d1__split_fields us_main_type)

(declare-const d2__split_fields us_main_type)

(declare-const d2__split_discrs natural)

;; Assume
  (assert (dynamic_invariant c true false true true))

(define-fun o () Int c)

(define-fun discr__p2__d__assume () us_rep (new_with_default o))

;; H
  (assert (new_with_default__function_guard discr__p2__d__assume o))

;; H
  (assert true)

;; H
  (assert
  (= (to_rep
     (rec__private_discr__p_with_default__c
     (us_split_discrs1 discr__p2__d__assume))) o))

(declare-const d__split_fields us_main_type)

;; H
  (assert
  (= (us_split_fieldsqtmk d__split_fields) (us_split_fields1
                                           discr__p2__d__assume)))

(declare-const d__split_discrs natural)

;; H
  (assert
  (= (us_split_discrsqtmk d__split_discrs) (us_split_discrs1
                                           discr__p2__d__assume)))

;; Assume
  (assert (= d__attr__constrained false))

;; Assume
  (assert true)

(define-fun o1 () Int c)

;; Ensures
  (assert (in_range o1))

;; Assume
  (assert (= d1__attr__constrained true))

;; Assume
  (assert (default_initial_assumption1
  (us_repqtmk d1__split_discrs (us_split_fieldsqtmk d1__split_fields))
  false))

;; Assume
  (assert (dynamic_invariant1
  (us_repqtmk d1__split_discrs (us_split_fieldsqtmk d1__split_fields)) false
  false true true))

;; Assume
  (assert (= d2__attr__constrained false))

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk d2__split_discrs)
  (us_split_fieldsqtmk d2__split_fields)) false))

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "discr.ads", line 22, characters 0-0
  (not (not (= d__attr__constrained true))))
(check-sat)

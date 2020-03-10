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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__private_with_attributes__private_unconstrained__c natural)))))
(define-fun us_split_discrs_rec__private_with_attributes__private_unconstrained__c__projection ((a us_split_discrs)) natural 
  (rec__private_with_attributes__private_unconstrained__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__private_with_attributes__private_unconstrained us_main_type)))))
(define-fun us_split_fields_rec__private_with_attributes__private_unconstrained__projection ((a us_split_fields)) us_main_type 
  (rec__private_with_attributes__private_unconstrained a))

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

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__private_with_attributes__private_unconstrained__c
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__private_with_attributes__private_unconstrained__c
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__private_with_attributes__private_unconstrained
                           (us_split_fields1 a))
                           (rec__private_with_attributes__private_unconstrained
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__private_with_attributes__private_unconstrained__c1 Int)
  (a us_split_discrs)) Bool (= rec__private_with_attributes__private_unconstrained__c1 
  (to_rep (rec__private_with_attributes__private_unconstrained__c a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const private_with_attributes__private_unconstrained__c__first__bit Int)

(declare-const private_with_attributes__private_unconstrained__c__last__bit Int)

(declare-const private_with_attributes__private_unconstrained__c__position Int)

;; private_with_attributes__private_unconstrained__c__first__bit_axiom
  (assert
  (<= 0 private_with_attributes__private_unconstrained__c__first__bit))

;; private_with_attributes__private_unconstrained__c__last__bit_axiom
  (assert
  (< private_with_attributes__private_unconstrained__c__first__bit private_with_attributes__private_unconstrained__c__last__bit))

;; private_with_attributes__private_unconstrained__c__position_axiom
  (assert (<= 0 private_with_attributes__private_unconstrained__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((private_unconstrained__ref 0))
(((private_unconstrained__refqtmk (private_unconstrained__content us_rep)))))
(define-fun private_unconstrained__ref_private_unconstrained__content__projection ((a private_unconstrained__ref)) us_rep 
  (private_unconstrained__content a))

(declare-const u__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (= (to_rep
                                            (rec__private_with_attributes__private_unconstrained__c
                                            (us_split_discrs1
                                            temp___expr_161))) 0))

(declare-const u1__attr__constrained Bool)

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

(declare-const private_with_attributes__private_unconstrained__c__first__bit1 Int)

(declare-const private_with_attributes__private_unconstrained__c__last__bit1 Int)

(declare-const private_with_attributes__private_unconstrained__c__position1 Int)

;; private_with_attributes__private_unconstrained__c__first__bit_axiom
  (assert
  (<= 0 private_with_attributes__private_unconstrained__c__first__bit1))

;; private_with_attributes__private_unconstrained__c__last__bit_axiom
  (assert
  (< private_with_attributes__private_unconstrained__c__first__bit1 private_with_attributes__private_unconstrained__c__last__bit1))

;; private_with_attributes__private_unconstrained__c__position_axiom
  (assert
  (<= 0 private_with_attributes__private_unconstrained__c__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tu2S__ref 0))
(((tu2S__refqtmk (tu2S__content us_rep)))))
(define-fun tu2S__ref_tu2S__content__projection ((a tu2S__ref)) us_rep 
  (tu2S__content a))

(declare-const u2__split_discrs us_split_discrs)

(declare-const u2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_170 us_rep)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (not (= temp___skip_constant_167 true))
                                     (in_range1 0
                                     (us_split_discrs1 temp___expr_170))))

(define-fun default_initial_assumption1 ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (= (to_rep
                                            (rec__private_with_attributes__private_unconstrained__c
                                            (us_split_discrs1
                                            temp___expr_172))) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const private_with_attributes__private_unconstrained__c__first__bit2 Int)

(declare-const private_with_attributes__private_unconstrained__c__last__bit2 Int)

(declare-const private_with_attributes__private_unconstrained__c__position2 Int)

;; private_with_attributes__private_unconstrained__c__first__bit_axiom
  (assert
  (<= 0 private_with_attributes__private_unconstrained__c__first__bit2))

;; private_with_attributes__private_unconstrained__c__last__bit_axiom
  (assert
  (< private_with_attributes__private_unconstrained__c__first__bit2 private_with_attributes__private_unconstrained__c__last__bit2))

;; private_with_attributes__private_unconstrained__c__position_axiom
  (assert
  (<= 0 private_with_attributes__private_unconstrained__c__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((private_constrained__ref 0))
(((private_constrained__refqtmk (private_constrained__content us_rep)))))
(define-fun private_constrained__ref_private_constrained__content__projection ((a private_constrained__ref)) us_rep 
  (private_constrained__content a))

(declare-const c__split_discrs us_split_discrs)

(declare-const c__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant2 ((temp___expr_179 us_rep)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (not (= temp___skip_constant_176 true))
                                     (in_range1 0
                                     (us_split_discrs1 temp___expr_179))))

(define-fun default_initial_assumption2 ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (= (to_rep
                                            (rec__private_with_attributes__private_unconstrained__c
                                            (us_split_discrs1
                                            temp___expr_181))) 0))

(declare-const r2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(assert
;; defqtvc
 ;; File "use_private_attributes.ads", line 5, characters 0-0
  (not
  (forall ((u1__split_fields us_main_type) (u1__split_discrs natural)
  (u2__split_fields us_main_type) (c__split_fields us_main_type))
  (=> (= u__attr__constrained true)
  (=> (= u1__attr__constrained false)
  (=> (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk u1__split_discrs)
  (us_split_fieldsqtmk u1__split_fields)) false)
  (=> (in_range 0)
  (=> (= u2__attr__constrained true)
  (=> (default_initial_assumption1
  (us_repqtmk u2__split_discrs (us_split_fieldsqtmk u2__split_fields)) false)
  (=> (dynamic_invariant1
  (us_repqtmk u2__split_discrs (us_split_fieldsqtmk u2__split_fields)) false
  false true true)
  (=> (= c__attr__constrained true)
  (=> (default_initial_assumption2
  (us_repqtmk c__split_discrs (us_split_fieldsqtmk c__split_fields)) false)
  (=> (dynamic_invariant2
  (us_repqtmk c__split_discrs (us_split_fieldsqtmk c__split_fields)) false
  false true true) (= u__attr__constrained true))))))))))))))
(check-sat)
(exit)

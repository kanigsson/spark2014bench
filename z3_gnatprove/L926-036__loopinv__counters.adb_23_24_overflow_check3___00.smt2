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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort change_mode 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (change_mode change_mode) Bool)

(declare-const dummy2 change_mode)

(declare-datatypes ()
((change_mode__ref (change_mode__refqtmk (change_mode__content change_mode)))))
(define-fun change_mode__ref_change_mode__content__projection ((a change_mode__ref)) change_mode 
  (change_mode__content a))

(declare-fun to_rep2 (change_mode) Int)

(declare-fun of_rep2 (Int) change_mode)

;; inversion_axiom
  (assert
  (forall ((x change_mode))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x change_mode)) (! (in_range2
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__counters__counter__mode change_mode)(rec__counters__counter__ticks natural)))))
(define-fun us_split_discrs_rec__counters__counter__mode__projection ((a us_split_discrs)) change_mode 
  (rec__counters__counter__mode a))

(define-fun us_split_discrs_rec__counters__counter__ticks__projection ((a us_split_discrs)) natural 
  (rec__counters__counter__ticks a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__counters__counter__c integer)(rec__counters__counter__t natural)))))
(define-fun us_split_fields_rec__counters__counter__c__projection ((a us_split_fields)) integer 
  (rec__counters__counter__c a))

(define-fun us_split_fields_rec__counters__counter__t__projection ((a us_split_fields)) natural 
  (rec__counters__counter__t a))

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
                        (and
                        (= (to_rep2
                           (rec__counters__counter__mode
                           (us_split_discrs1 a))) (to_rep2
                                                  (rec__counters__counter__mode
                                                  (us_split_discrs1 b))))
                        (= (to_rep1
                           (rec__counters__counter__ticks
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__counters__counter__ticks
                                                  (us_split_discrs1 b)))))
                        (and
                        (= (to_rep
                           (rec__counters__counter__c (us_split_fields1 a))) 
                        (to_rep
                        (rec__counters__counter__c (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__counters__counter__t (us_split_fields1 a))) 
                        (to_rep1
                        (rec__counters__counter__t (us_split_fields1 b))))))
                   true false))

(define-fun in_range3 ((rec__counters__counter__mode1 Int)
  (rec__counters__counter__ticks1 Int)
  (a us_split_discrs)) Bool (and
                            (= rec__counters__counter__mode1 (to_rep2
                                                             (rec__counters__counter__mode
                                                             a)))
                            (= rec__counters__counter__ticks1 (to_rep1
                                                              (rec__counters__counter__ticks
                                                              a)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const counters__counter__mode__first__bit Int)

(declare-const counters__counter__mode__last__bit Int)

(declare-const counters__counter__mode__position Int)

;; counters__counter__mode__first__bit_axiom
  (assert (<= 0 counters__counter__mode__first__bit))

;; counters__counter__mode__last__bit_axiom
  (assert
  (< counters__counter__mode__first__bit counters__counter__mode__last__bit))

;; counters__counter__mode__position_axiom
  (assert (<= 0 counters__counter__mode__position))

(declare-const counters__counter__ticks__first__bit Int)

(declare-const counters__counter__ticks__last__bit Int)

(declare-const counters__counter__ticks__position Int)

;; counters__counter__ticks__first__bit_axiom
  (assert (<= 0 counters__counter__ticks__first__bit))

;; counters__counter__ticks__last__bit_axiom
  (assert
  (< counters__counter__ticks__first__bit counters__counter__ticks__last__bit))

;; counters__counter__ticks__position_axiom
  (assert (<= 0 counters__counter__ticks__position))

(declare-const counters__counter__c__first__bit Int)

(declare-const counters__counter__c__last__bit Int)

(declare-const counters__counter__c__position Int)

;; counters__counter__c__first__bit_axiom
  (assert (<= 0 counters__counter__c__first__bit))

;; counters__counter__c__last__bit_axiom
  (assert
  (< counters__counter__c__first__bit counters__counter__c__last__bit))

;; counters__counter__c__position_axiom
  (assert (<= 0 counters__counter__c__position))

(declare-const counters__counter__t__first__bit Int)

(declare-const counters__counter__t__last__bit Int)

(declare-const counters__counter__t__position Int)

;; counters__counter__t__first__bit_axiom
  (assert (<= 0 counters__counter__t__first__bit))

;; counters__counter__t__last__bit_axiom
  (assert
  (< counters__counter__t__first__bit counters__counter__t__last__bit))

;; counters__counter__t__position_axiom
  (assert (<= 0 counters__counter__t__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((counter__ref (counter__refqtmk (counter__content us_rep)))))
(define-fun counter__ref_counter__content__projection ((a counter__ref)) us_rep 
  (counter__content a))

(declare-const c__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 4)) (in_range2 temp___expr_159)))

(declare-const c__split_fields us_split_fields)

;; Assume
  (assert true)

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 (rec__counters__counter__t c__split_fields)) o))

(define-fun o1 () Int (+ o 1))

;; Ensures
  (assert (in_range o1))

(declare-const o2 natural)

;; Ensures
  (assert (= (to_rep1 o2) o1))

(declare-const c__split_fields1 us_split_fields)

;; H
  (assert
  (= c__split_fields1 (us_split_fieldsqtmk
                      (rec__counters__counter__c c__split_fields) o2)))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep2 (rec__counters__counter__mode c__split_discrs)) 
  o3))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= o3 0) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep2 (rec__counters__counter__mode c__split_discrs)) 
  o4))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= o4 1) true false)))

;; H
  (assert (= spark__branch1 true))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep1 (rec__counters__counter__ticks c__split_discrs)) 
  o5))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep1 (rec__counters__counter__t c__split_fields1)) o6))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (<= o5 o6) true false)))

;; H
  (assert (not (= spark__branch2 true)))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep (rec__counters__counter__c c__split_fields1)) o7))

(assert
;; defqtvc
 ;; File "counters.ads", line 11, characters 0-0
  (not (in_range (+ o7 1))))
(check-sat)

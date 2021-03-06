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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__c393012__ticket__flight natural)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__c393012__ticket__flight__projection ((a us_split_fields)) natural 
  (rec__c393012__ticket__flight a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__c393012__ticket__flight
                           (us_split_fields1 a))) (to_rep
                                                  (rec__c393012__ticket__flight
                                                  (us_split_fields1 b))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const c393012__ticket__flight__first__bit Int)

(declare-const c393012__ticket__flight__last__bit Int)

(declare-const c393012__ticket__flight__position Int)

;; c393012__ticket__flight__first__bit_axiom
  (assert (<= 0 c393012__ticket__flight__first__bit))

;; c393012__ticket__flight__last__bit_axiom
  (assert
  (< c393012__ticket__flight__first__bit c393012__ticket__flight__last__bit))

;; c393012__ticket__flight__position_axiom
  (assert (<= 0 c393012__ticket__flight__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((ticket__ref 0))
(((ticket__refqtmk (ticket__content us_rep)))))
(define-fun ticket__ref_ticket__content__projection ((a ticket__ref)) us_rep 
  (ticket__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__c393012__tix__is_null_pointer Bool)(rec__c393012__tix__pointer_address Int)(rec__c393012__tix__pointer_value us_rep)))))
(define-fun us_rep_rec__c393012__tix__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__c393012__tix__is_null_pointer a))

(define-fun us_rep_rec__c393012__tix__pointer_address__projection ((a us_rep1)) Int 
  (rec__c393012__tix__pointer_address a))

(define-fun us_rep_rec__c393012__tix__pointer_value__projection ((a us_rep1)) us_rep 
  (rec__c393012__tix__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__c393012__tix__is_null_pointer a) (rec__c393012__tix__is_null_pointer
                                                                   b))
                         (=>
                         (not
                         (= (rec__c393012__tix__is_null_pointer a) true))
                         (and
                         (= (rec__c393012__tix__pointer_address a) (rec__c393012__tix__pointer_address
                                                                   b))
                         (= (rec__c393012__tix__pointer_value a) (rec__c393012__tix__pointer_value
                                                                 b)))))
                    true false))

(define-fun rec__c393012__tix__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__c393012__tix__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert (= (rec__c393012__tix__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep1)

(declare-datatypes ((tix__ref 0))
(((tix__refqtmk (tix__content us_rep1)))))
(define-fun tix__ref_tix__content__projection ((a tix__ref)) us_rep1 
  (tix__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep1))))))
(declare-fun slide ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq1 (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq1 (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const i (Array Int us_rep1))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const t__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (= (attr__tag temp___expr_181) 
  us_tag))

(declare-sort titineraryD1 0)

(declare-fun titineraryD1qtint (titineraryD1) Int)

;; titineraryD1'axiom
  (assert
  (forall ((i1 titineraryD1))
  (and (<= 1 (titineraryD1qtint i1)) (<= (titineraryD1qtint i1) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (titineraryD1 titineraryD1) Bool)

(declare-const dummy3 titineraryD1)

(declare-datatypes ((titineraryD1__ref 0))
(((titineraryD1__refqtmk (titineraryD1__content titineraryD1)))))
(define-fun titineraryD1__ref_titineraryD1__content__projection ((a titineraryD1__ref)) titineraryD1 
  (titineraryD1__content a))

(define-fun default_initial_assumption1 ((temp___expr_202 (Array Int us_rep1))
  (temp___skip_top_level_203 Bool)) Bool (forall ((temp___204 Int))
                                         (=>
                                         (and (<= 1 temp___204)
                                         (<= temp___204 3))
                                         (= (rec__c393012__tix__is_null_pointer
                                            (select temp___expr_202 temp___204)) true))))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun default_initial_assumption2 ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (rec__c393012__tix__is_null_pointer
                                            temp___expr_194) true))

(assert
;; defqtvc
 ;; File "c393012.adb", line 10, characters 0-0
  (not (rec__c393012__tix__pointer_value__pred (select i 1))))
(check-sat)
(exit)

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__base__t__c integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__base__t__c__projection ((a us_split_fields)) integer 
  (rec__base__t__c a))

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
  (b us_rep)) Bool (ite (= (to_rep (rec__base__t__c (us_split_fields1 a))) 
                   (to_rep (rec__base__t__c (us_split_fields1 b)))) true
                   false))

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

(declare-const base__t__c__first__bit Int)

(declare-const base__t__c__last__bit Int)

(declare-const base__t__c__position Int)

;; base__t__c__first__bit_axiom
  (assert (<= 0 base__t__c__first__bit))

;; base__t__c__last__bit_axiom
  (assert (< base__t__c__first__bit base__t__c__last__bit))

;; base__t__c__position_axiom
  (assert (<= 0 base__t__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun sum (us_rep) Int)

(declare-fun sum__function_guard (Int us_rep) Bool)

(declare-fun sum1 (Int us_rep) Int)

(declare-fun sum__function_guard1 (Int Int us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (= (attr__tag temp___expr_161) 
  us_tag))

;; sum__post_axiom
  (assert
  (forall ((x us_rep))
  (! (let ((result (sum x)))
     (=> (sum__function_guard result x) (dynamic_invariant result true false
     true true))) :pattern ((sum x)) )))

;; sum__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((x us_rep))
  (! (let ((result (sum1 attr__tag1 x)))
     (=> (sum__function_guard1 result attr__tag1 x) (dynamic_invariant result
     true false true true))) :pattern ((sum1 attr__tag1 x)) ))))

;; base__t__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (sum__function_guard1 (sum1 us_tag x) us_tag x)
     (and (forall ((x1 us_rep)) (sum__function_guard (sum x1) x1))
     (= (sum x) (sum1 us_tag x)))) :pattern ((sum1 us_tag x)) )))

;; sum__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (sum x) (to_rep (rec__base__t__c (us_split_fields1 x)))) :pattern (
  (sum x)) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(assert
;; defqtvc
 ;; File "base.ads", line 8, characters 0-0
  (not
  (forall ((o integer) (base__create__result us_rep))
  (=> (dynamic_invariant c true false true true)
  (=> (= (to_rep o) c)
  (=>
  (= base__create__result (us_repqtmk (us_split_fieldsqtmk o us_null_ext__)
                          us_tag))
  (=>
  (forall ((base__create__result1 us_rep)) (sum__function_guard
  (sum base__create__result1) base__create__result1))
  (= (sum base__create__result) c))))))))
(check-sat)
(exit)

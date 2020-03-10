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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__types__t__d integer)))))
(define-fun us_split_discrs_rec__types__t__d__projection ((a us_split_discrs)) integer 
  (rec__types__t__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__types__t__c integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__types__t__c__projection ((a us_split_fields)) integer 
  (rec__types__t__c a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__types__t__d (us_split_discrs1 a))) 
                        (to_rep (rec__types__t__d (us_split_discrs1 b))))
                        (= (to_rep (rec__types__t__c (us_split_fields1 a))) 
                        (to_rep (rec__types__t__c (us_split_fields1 b)))))
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

(declare-const types__t__d__first__bit Int)

(declare-const types__t__d__last__bit Int)

(declare-const types__t__d__position Int)

;; types__t__d__first__bit_axiom
  (assert (<= 0 types__t__d__first__bit))

;; types__t__d__last__bit_axiom
  (assert (< types__t__d__first__bit types__t__d__last__bit))

;; types__t__d__position_axiom
  (assert (<= 0 types__t__d__position))

(declare-const types__t__c__first__bit Int)

(declare-const types__t__c__last__bit Int)

(declare-const types__t__c__position Int)

;; types__t__c__first__bit_axiom
  (assert (<= 0 types__t__c__first__bit))

;; types__t__c__last__bit_axiom
  (assert (< types__t__c__first__bit types__t__c__last__bit))

;; types__t__c__position_axiom
  (assert (<= 0 types__t__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((txS__ref 0))
(((txS__refqtmk (txS__content us_rep)))))
(define-fun txS__ref_txS__content__projection ((a txS__ref)) us_rep (txS__content
                                                                    a))

(declare-const us_tag1 Int)

(define-fun in_range1 ((rec__types__t__d1 Int)
  (a us_split_discrs)) Bool (= rec__types__t__d1 (to_rep
                                                 (rec__types__t__d a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const types__t__d__first__bit1 Int)

(declare-const types__t__d__last__bit1 Int)

(declare-const types__t__d__position1 Int)

;; types__t__d__first__bit_axiom
  (assert (<= 0 types__t__d__first__bit1))

;; types__t__d__last__bit_axiom
  (assert (< types__t__d__first__bit1 types__t__d__last__bit1))

;; types__t__d__position_axiom
  (assert (<= 0 types__t__d__position1))

(declare-const types__t__c__first__bit1 Int)

(declare-const types__t__c__last__bit1 Int)

(declare-const types__t__c__position1 Int)

;; types__t__c__first__bit_axiom
  (assert (<= 0 types__t__c__first__bit1))

;; types__t__c__last__bit_axiom
  (assert (< types__t__c__first__bit1 types__t__c__last__bit1))

;; types__t__c__position_axiom
  (assert (<= 0 types__t__c__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const x__split_discrs us_split_discrs)

(declare-const x__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun valid (us_rep) Bool)

(declare-fun valid__function_guard (Bool us_rep) Bool)

;; valid__post_axiom
  (assert true)

;; valid__def_axiom
  (assert (forall ((x us_rep)) (! (= (valid x) true) :pattern ((valid x)) )))

(assert
;; defqtvc
 ;; File "use_types.adb", line 2, characters 0-0
  (not (in_range 3)))
(check-sat)
(exit)

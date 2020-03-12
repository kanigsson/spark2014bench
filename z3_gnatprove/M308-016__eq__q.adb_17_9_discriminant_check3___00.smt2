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
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__q__t__b Bool)))))
(define-fun us_split_discrs_rec__q__t__b__projection ((a us_split_discrs)) Bool 
  (rec__q__t__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__q__t__a integer)(rec__q__t__c Bool)))))
(define-fun us_split_fields_rec__q__t__a__projection ((a us_split_fields)) integer 
  (rec__q__t__a a))

(define-fun us_split_fields_rec__q__t__c__projection ((a us_split_fields)) Bool 
  (rec__q__t__c a))

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

(define-fun q__t__a__pred ((a us_rep)) Bool (= (ite (rec__q__t__b
                                                    (us_split_discrs1 a)) 1 0) 1))

(define-fun q__t__c__pred ((a us_rep)) Bool (= (ite (rec__q__t__b
                                                    (us_split_discrs1 a)) 1 0) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__q__t__b (us_split_discrs1 a)) 1 0) (ite 
                        (rec__q__t__b (us_split_discrs1 b)) 1 0))
                        (and
                        (=> (q__t__a__pred a)
                        (= (to_rep (rec__q__t__a (us_split_fields1 a))) 
                        (to_rep (rec__q__t__a (us_split_fields1 b)))))
                        (=> (q__t__c__pred a)
                        (= (ite (rec__q__t__c (us_split_fields1 a)) 1 0) (ite 
                        (rec__q__t__c (us_split_fields1 b)) 1 0)))))
                   true false))

(define-fun in_range2 ((rec__q__t__b1 Bool)
  (a us_split_discrs)) Bool (= rec__q__t__b1 (rec__q__t__b a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const q__t__b__first__bit Int)

(declare-const q__t__b__last__bit Int)

(declare-const q__t__b__position Int)

;; q__t__b__first__bit_axiom
  (assert (<= 0 q__t__b__first__bit))

;; q__t__b__last__bit_axiom
  (assert (< q__t__b__first__bit q__t__b__last__bit))

;; q__t__b__position_axiom
  (assert (<= 0 q__t__b__position))

(declare-const q__t__a__first__bit Int)

(declare-const q__t__a__last__bit Int)

(declare-const q__t__a__position Int)

;; q__t__a__first__bit_axiom
  (assert (<= 0 q__t__a__first__bit))

;; q__t__a__last__bit_axiom
  (assert (< q__t__a__first__bit q__t__a__last__bit))

;; q__t__a__position_axiom
  (assert (<= 0 q__t__a__position))

(declare-const q__t__c__first__bit Int)

(declare-const q__t__c__last__bit Int)

(declare-const q__t__c__position Int)

;; q__t__c__first__bit_axiom
  (assert (<= 0 q__t__c__first__bit))

;; q__t__c__last__bit_axiom
  (assert (< q__t__c__first__bit q__t__c__last__bit))

;; q__t__c__position_axiom
  (assert (<= 0 q__t__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun change (us_rep) us_rep)

(declare-fun change__function_guard (us_rep us_rep) Bool)

;; change__post_axiom
  (assert true)

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r4b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r6b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const x__split_fields us_split_fields)

(declare-const y__split_fields us_split_fields)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert
  (= (bool_eq (us_repqtmk x__split_discrs x__split_fields)
     (us_repqtmk y__split_discrs y__split_fields)) true))

;; Assume
  (assert (= (rec__q__t__b x__split_discrs) r4b))

(define-fun o () us_rep (us_repqtmk x__split_discrs x__split_fields))

(define-fun temp___192 () us_rep (change o))

;; H
  (assert (change__function_guard temp___192 o))

;; H
  (assert true)

;; Assert
  (assert
  (= (rec__q__t__b (us_split_discrs1 temp___192)) (rec__q__t__b
                                                  x__split_discrs)))

(declare-const x__split_fields1 us_split_fields)

;; H
  (assert (= x__split_fields1 (us_split_fields1 temp___192)))

;; Assume
  (assert (= x__split_discrs (us_split_discrs1 temp___192)))

;; Assume
  (assert (= (rec__q__t__b y__split_discrs) r6b))

(define-fun o1 () us_rep (us_repqtmk y__split_discrs y__split_fields))

(define-fun temp___195 () us_rep (change o1))

;; H
  (assert (change__function_guard temp___195 o1))

;; H
  (assert true)

(assert
;; defqtvc
 ;; File "q.ads", line 21, characters 0-0
  (not
  (= (rec__q__t__b (us_split_discrs1 temp___195)) (rec__q__t__b
                                                  y__split_discrs))))
(check-sat)

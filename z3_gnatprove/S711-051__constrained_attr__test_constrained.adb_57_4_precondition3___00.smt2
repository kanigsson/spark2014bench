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

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__test_constrained__cc__b Bool)))))
(define-fun us_split_discrs_rec__test_constrained__cc__b__projection ((a us_split_discrs)) Bool 
  (rec__test_constrained__cc__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__test_constrained__cc__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_constrained__cc__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                   true false))

(define-fun in_range1 ((rec__test_constrained__cc__b1 Bool)
  (a us_split_discrs)) Bool (= rec__test_constrained__cc__b1 (rec__test_constrained__cc__b
                                                             a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_constrained__cc__b__first__bit Int)

(declare-const test_constrained__cc__b__last__bit Int)

(declare-const test_constrained__cc__b__position Int)

;; test_constrained__cc__b__first__bit_axiom
  (assert (<= 0 test_constrained__cc__b__first__bit))

;; test_constrained__cc__b__last__bit_axiom
  (assert
  (< test_constrained__cc__b__first__bit test_constrained__cc__b__last__bit))

;; test_constrained__cc__b__position_axiom
  (assert (<= 0 test_constrained__cc__b__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes () ((cc__ref (cc__refqtmk (cc__content us_rep)))))
(define-fun cc__ref_cc__content__projection ((a cc__ref)) us_rep (cc__content
                                                                 a))

(declare-fun f (tuple0) us_rep)

(declare-fun f__function_guard (us_rep tuple0) Bool)

(define-fun default_initial_assumption ((temp___expr_185 us_rep)
  (temp___skip_top_level_186 Bool)) Bool (= (rec__test_constrained__cc__b
                                            (us_split_discrs1
                                            temp___expr_185)) (distinct 0 0)))

;; f__post_axiom
  (assert true)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__test_constrained__cc_h__c us_rep)))))
(define-fun us_split_fields_rec__test_constrained__cc_h__c__projection ((a us_split_fields)) us_rep 
  (rec__test_constrained__cc_h__c a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (bool_eq
                            (rec__test_constrained__cc_h__c
                            (us_split_fields1 a))
                            (rec__test_constrained__cc_h__c
                            (us_split_fields1 b))) true)
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

(declare-const test_constrained__cc_h__c__first__bit Int)

(declare-const test_constrained__cc_h__c__last__bit Int)

(declare-const test_constrained__cc_h__c__position Int)

;; test_constrained__cc_h__c__first__bit_axiom
  (assert (<= 0 test_constrained__cc_h__c__first__bit))

;; test_constrained__cc_h__c__last__bit_axiom
  (assert
  (< test_constrained__cc_h__c__first__bit test_constrained__cc_h__c__last__bit))

;; test_constrained__cc_h__c__position_axiom
  (assert (<= 0 test_constrained__cc_h__c__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes () ((cc_h__ref (cc_h__refqtmk (cc_h__content us_rep1)))))
(define-fun cc_h__ref_cc_h__content__projection ((a cc_h__ref)) us_rep1 
  (cc_h__content a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (rec__test_constrained__cc_acc__is_null_pointer Bool)(rec__test_constrained__cc_acc__pointer_address Int)(rec__test_constrained__cc_acc__pointer_value us_rep1)))))
(define-fun us_rep_rec__test_constrained__cc_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__test_constrained__cc_acc__is_null_pointer a))

(define-fun us_rep_rec__test_constrained__cc_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__test_constrained__cc_acc__pointer_address a))

(define-fun us_rep_rec__test_constrained__cc_acc__pointer_value__projection ((a us_rep2)) us_rep1 
  (rec__test_constrained__cc_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep2)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep2 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__test_constrained__cc_acc__is_null_pointer
                            a) (rec__test_constrained__cc_acc__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__test_constrained__cc_acc__is_null_pointer
                            a) true))
                         (and
                         (= (rec__test_constrained__cc_acc__pointer_address
                            a) (rec__test_constrained__cc_acc__pointer_address
                               b))
                         (= (rec__test_constrained__cc_acc__pointer_value a) 
                         (rec__test_constrained__cc_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_constrained__cc_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__test_constrained__cc_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_constrained__cc_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep2)

(declare-datatypes ()
((cc_acc__ref (cc_acc__refqtmk (cc_acc__content us_rep2)))))
(define-fun cc_acc__ref_cc_acc__content__projection ((a cc_acc__ref)) us_rep2 
  (cc_acc__content a))

(declare-fun f_acc (tuple0) us_rep2)

(declare-fun f_acc__function_guard (us_rep2 tuple0) Bool)

(define-fun default_initial_assumption1 ((temp___expr_204 us_rep2)
  (temp___skip_top_level_205 Bool)) Bool (= (rec__test_constrained__cc_acc__is_null_pointer
                                            temp___expr_204) true))

(declare-fun f_h (tuple0) us_rep1)

(declare-fun f_h__function_guard (us_rep1 tuple0) Bool)

(define-fun default_initial_assumption2 ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (rec__test_constrained__cc__b
                                            (us_split_discrs1
                                            (rec__test_constrained__cc_h__c
                                            (us_split_fields1
                                            temp___expr_194)))) (distinct 0 0)))

;; f_h__post_axiom
  (assert true)

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x__split_discrs Bool)

;; Assert
  (assert true)

;; Assert
  (assert true)

;; Assert
  (assert true)

;; Assume
  (assert (= x__attr__constrained false))

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk x__split_discrs)) false))

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "test_constrained.adb", line 1, characters 0-0
  (not (not (= x__attr__constrained true))))
(check-sat)

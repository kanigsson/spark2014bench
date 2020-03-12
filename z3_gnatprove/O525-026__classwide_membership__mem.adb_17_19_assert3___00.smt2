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

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep) (b us_rep)) Bool (ite true true false))

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

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ()
((derived__ref (derived__refqtmk (derived__content us_rep)))))
(define-fun derived__ref_derived__content__projection ((a derived__ref)) us_rep 
  (derived__content a))

(declare-const x__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_191 us_rep)
  (temp___skip_top_level_192 Bool)) Bool (= (attr__tag temp___expr_191) 
  us_tag))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((root__ref (root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-fun test_mem (us_rep) Bool)

(declare-fun test_mem__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption1 ((temp___expr_184 us_rep)
  (temp___skip_top_level_185 Bool)) Bool (= (attr__tag temp___expr_184) 
  us_tag1))

;; test_mem__post_axiom
  (assert true)

;; test_mem__def_axiom
  (assert
  (forall ((v us_rep))
  (! (= (= (test_mem v) true) (= (attr__tag v) us_tag)) :pattern ((test_mem
                                                                  v)) )))

(declare-fun test_mem_class (us_rep) Bool)

(declare-fun test_mem_class__function_guard (Bool us_rep) Bool)

(declare-fun us_compatible_tags (Int Int) Bool)

;; __compatible_tags_refl
  (assert (forall ((tag Int)) (us_compatible_tags tag tag)))

;; test_mem_class__post_axiom
  (assert true)

;; test_mem_class__def_axiom
  (assert
  (forall ((v us_rep))
  (! (= (= (test_mem_class v) true) (us_compatible_tags (attr__tag v)
     us_tag)) :pattern ((test_mem_class v)) )))

(declare-fun test_mem_class1 (us_rep) Bool)

(declare-fun test_mem_class1__function_guard (Bool us_rep) Bool)

;; test_mem_class1__post_axiom
  (assert true)

;; test_mem_class1__def_axiom
  (assert
  (forall ((v us_rep))
  (! (= (= (test_mem_class1 v) true)
     (or (us_compatible_tags (attr__tag v) us_tag) (= (attr__tag v) us_tag))) :pattern (
  (test_mem_class1 v)) )))

(declare-fun test_mem_class2 (us_rep) Bool)

(declare-fun test_mem_class2__function_guard (Bool us_rep) Bool)

;; test_mem_class2__post_axiom
  (assert true)

;; test_mem_class2__def_axiom
  (assert
  (forall ((v us_rep))
  (! (= (= (test_mem_class2 v) true)
     (or (= (attr__tag v) us_tag) (us_compatible_tags (attr__tag v) us_tag))) :pattern (
  (test_mem_class2 v)) )))

(declare-const x__split_fields us_private)

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk (us_split_fieldsqtmk x__split_fields) x__attr__tag) false))

;; Assume
  (assert true)

;; H
  (assert
  (forall ((x__split_fields1 us_private)) (test_mem__function_guard
  (test_mem (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))))

;; Assert
  (assert
  (= (test_mem
     (us_repqtmk (us_split_fieldsqtmk x__split_fields) x__attr__tag)) true))

;; H
  (assert
  (forall ((x__split_fields1 us_private)) (test_mem_class__function_guard
  (test_mem_class
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))))

;; Assert
  (assert
  (= (test_mem_class
     (us_repqtmk (us_split_fieldsqtmk x__split_fields) x__attr__tag)) true))

;; H
  (assert
  (forall ((x__split_fields1 us_private)) (test_mem_class1__function_guard
  (test_mem_class1
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))))

;; Assert
  (assert
  (= (test_mem_class1
     (us_repqtmk (us_split_fieldsqtmk x__split_fields) x__attr__tag)) true))

;; H
  (assert
  (forall ((x__split_fields1 us_private)) (test_mem_class2__function_guard
  (test_mem_class2
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))
  (us_repqtmk (us_split_fieldsqtmk x__split_fields1) x__attr__tag))))

(assert
;; defqtvc
 ;; File "mem.adb", line 1, characters 0-0
  (not
  (= (test_mem_class2
     (us_repqtmk (us_split_fieldsqtmk x__split_fields) x__attr__tag)) true)))
(check-sat)

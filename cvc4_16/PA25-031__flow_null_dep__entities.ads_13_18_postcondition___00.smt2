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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(declare-fun get_current_id (Int) Int)

(declare-fun get_current_id__function_guard (Int Int) Bool)

(declare-fun get_current_id1 (Int) Int)

(declare-fun get_current_id__function_guard1 (Int Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort id_index 0)

(declare-fun id_indexqtint (id_index) Int)

;; id_index'axiom
  (assert
  (forall ((i id_index))
  (and (<= 1 (id_indexqtint i)) (<= (id_indexqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (id_index id_index) Bool)

(declare-const dummy1 id_index)

(declare-datatypes ((id_index__ref 0))
(((id_index__refqtmk (id_index__content id_index)))))
(define-fun id_index__ref_id_index__content__projection ((a id_index__ref)) id_index 
  (id_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 10)) (in_range1 temp___expr_160)))

;; get_current_id__post_axiom
  (assert
  (forall ((entities__current_id Int))
  (! (=> (dynamic_invariant1 entities__current_id true true true true)
     (let ((result (get_current_id entities__current_id)))
     (=> (get_current_id__function_guard result entities__current_id)
     (dynamic_invariant1 result true false true true)))) :pattern ((get_current_id
                                                                   entities__current_id)) )))

;; get_current_id__post_refine_axiom
  (assert
  (forall ((entities__current_id Int))
  (! (=> (dynamic_invariant1 entities__current_id true true true true)
     (let ((result (get_current_id1 entities__current_id)))
     (=> (get_current_id__function_guard1 result entities__current_id)
     (and (= result entities__current_id) (dynamic_invariant1 result true
     false true true))))) :pattern ((get_current_id1 entities__current_id)) )))

(declare-fun get_current_cycles (Int) Int)

(declare-fun get_current_cycles__function_guard (Int Int) Bool)

(declare-fun get_current_cycles1 (Int) Int)

(declare-fun get_current_cycles__function_guard1 (Int Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

;; get_current_cycles__post_axiom
  (assert
  (forall ((entities__current_cycles Int))
  (! (=> (dynamic_invariant entities__current_cycles true true true true)
     (let ((result (get_current_cycles entities__current_cycles)))
     (=> (get_current_cycles__function_guard result entities__current_cycles)
     (dynamic_invariant result true false true true)))) :pattern ((get_current_cycles
                                                                  entities__current_cycles)) )))

;; get_current_cycles__post_refine_axiom
  (assert
  (forall ((entities__current_cycles Int))
  (! (=> (dynamic_invariant entities__current_cycles true true true true)
     (let ((result (get_current_cycles1 entities__current_cycles)))
     (=> (get_current_cycles__function_guard1 result
     entities__current_cycles)
     (and (= result entities__current_cycles) (dynamic_invariant result true
     false true true))))) :pattern ((get_current_cycles1
                                    entities__current_cycles)) )))

(assert
;; defqtvc
 ;; File "entities.ads", line 9, characters 0-0
  (not
  (forall ((current_id Int) (current_cycles Int) (current_id1 Int))
  (=> (dynamic_invariant1 current_id false false true true)
  (=> (dynamic_invariant current_cycles false false true true)
  (=> (= current_id1 1)
  (=>
  (forall ((current_id2 Int)) (get_current_id__function_guard1
  (get_current_id1 current_id2) current_id2))
  (= (get_current_id1 current_id1) 1))))))))
(check-sat)
(exit)

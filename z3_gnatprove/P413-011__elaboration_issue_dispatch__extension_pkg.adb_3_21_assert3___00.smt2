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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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

(declare-datatypes () ((root__ref (root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__extension_pkg__ext__flag Bool)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__extension_pkg__ext__flag__projection ((a us_split_fields2)) Bool 
  (rec__extension_pkg__ext__flag a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (Bool us_private) us_private)

(declare-fun extract__extension_pkg__ext__flag (us_private) Bool)

;; extract__extension_pkg__ext__flag__conv
  (assert
  (forall ((extension_pkg__ext__flag Bool))
  (forall ((rec__ext__2 us_private))
  (= (ite (extract__extension_pkg__ext__flag
          (hide_ext__ extension_pkg__ext__flag rec__ext__2)) 1 0) (ite extension_pkg__ext__flag 1 0)))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (hide_ext__
                                         (rec__extension_pkg__ext__flag
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__extension_pkg__ext__flag
                                         (rec__ext__ (us_split_fields1 r)))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (ite (rec__extension_pkg__ext__flag
                                 (us_split_fields3 a)) 1 0) (ite (rec__extension_pkg__ext__flag
                                                                 (us_split_fields3
                                                                 b)) 1 0))
                    true false))

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

(declare-const extension_pkg__ext__flag__first__bit Int)

(declare-const extension_pkg__ext__flag__last__bit Int)

(declare-const extension_pkg__ext__flag__position Int)

;; extension_pkg__ext__flag__first__bit_axiom
  (assert (<= 0 extension_pkg__ext__flag__first__bit))

;; extension_pkg__ext__flag__last__bit_axiom
  (assert
  (< extension_pkg__ext__flag__first__bit extension_pkg__ext__flag__last__bit))

;; extension_pkg__ext__flag__position_axiom
  (assert (<= 0 extension_pkg__ext__flag__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes () ((ext__ref (ext__refqtmk (ext__content us_rep1)))))
(define-fun ext__ref_ext__content__projection ((a ext__ref)) us_rep1 
  (ext__content a))

(declare-fun get (us_rep1 Bool) Bool)

(declare-fun get__function_guard (Bool us_rep1 Bool) Bool)

(declare-fun get1 (Int us_rep1 Bool) Bool)

(declare-fun get__function_guard1 (Bool Int us_rep1 Bool) Bool)

(declare-const x us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_172 us_rep1)
  (temp___skip_top_level_173 Bool)) Bool (= (attr__tag1 temp___expr_172) 
  us_tag1))

;; get__post_axiom
  (assert true)

;; get__post__dispatch_axiom
  (assert true)

;; extension_pkg__ext__compat_axiom
  (assert
  (forall ((x1 us_rep1))
  (forall ((extension_pkg__body_elaborated Bool))
  (! (=> (get__function_guard1
     (get1 us_tag1 x1 extension_pkg__body_elaborated) us_tag1 x1
     extension_pkg__body_elaborated)
     (and
     (forall ((x2 us_rep1) (extension_pkg__body_elaborated1 Bool))
     (get__function_guard (get x2 extension_pkg__body_elaborated1) x2
     extension_pkg__body_elaborated1))
     (= (ite (get x1 extension_pkg__body_elaborated) 1 0) (ite (get1 
                                                               us_tag1 x1
                                                               extension_pkg__body_elaborated) 1 0)))) :pattern (
  (get1 us_tag1 x1 extension_pkg__body_elaborated)) ))))

;; get__def_axiom
  (assert
  (forall ((x1 us_rep1))
  (forall ((extension_pkg__body_elaborated Bool))
  (! (= (= (get x1 extension_pkg__body_elaborated) true)
     (= extension_pkg__body_elaborated true)) :pattern ((get x1
                                                        extension_pkg__body_elaborated)) ))))

(define-fun default_initial_assumption1 ((temp___expr_165 us_rep)
  (temp___skip_top_level_166 Bool)) Bool (= (attr__tag temp___expr_165) 
  us_tag))

(declare-const body_elaborated Bool)

;; Assume
  (assert true)

;; H
  (assert
  (forall ((body_elaborated1 Bool)) (get__function_guard
  (get x body_elaborated1) x body_elaborated1)))

;; Assume
  (assert (= (get x body_elaborated) true))

(assert
;; defqtvc
 ;; File "extension_pkg.ads", line 10, characters 0-0
  (not (= body_elaborated true)))
(check-sat)

(exit)

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

(declare-sort pt 0)

(declare-fun user_eq (pt pt) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-datatypes () ((pt__ref (pt__refqtmk (pt__content pt)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) pt (pt__content a))

(declare-sort any_priority 0)

(declare-fun any_priorityqtint (any_priority) Int)

;; any_priority'axiom
  (assert
  (forall ((i any_priority))
  (and (<= 0 (any_priorityqtint i)) (<= (any_priorityqtint i) 98))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 98)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq1 (any_priority any_priority) Bool)

(declare-const dummy any_priority)

(declare-datatypes ()
((any_priority__ref
 (any_priority__refqtmk (any_priority__content any_priority)))))
(define-fun any_priority__ref_any_priority__content__projection ((a any_priority__ref)) any_priority 
  (any_priority__content a))

(declare-sort interrupt_priority 0)

(declare-fun interrupt_priorityqtint (interrupt_priority) Int)

;; interrupt_priority'axiom
  (assert
  (forall ((i interrupt_priority))
  (and (<= 98 (interrupt_priorityqtint i))
  (<= (interrupt_priorityqtint i) 98))))

(define-fun in_range1 ((x Int)) Bool (and (<= 98 x) (<= x 98)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (interrupt_priority interrupt_priority) Bool)

(declare-const dummy1 interrupt_priority)

(declare-datatypes ()
((interrupt_priority__ref
 (interrupt_priority__refqtmk
 (interrupt_priority__content interrupt_priority)))))
(define-fun interrupt_priority__ref_interrupt_priority__content__projection ((a interrupt_priority__ref)) interrupt_priority 
  (interrupt_priority__content a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 98)) (in_range temp___expr_158)))

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 98 98)) (in_range1 temp___expr_172)))

(declare-const self__ pt)

(assert
;; defqtvc
 ;; File "p.ads", line 3, characters 0-0
  (not (<= 98 (- 1))))
(check-sat)

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

(declare-fun bad_interrupt_priority (tuple0) Int)

(declare-fun bad_interrupt_priority__function_guard (Int tuple0) Bool)

(declare-sort pt2 0)

(declare-fun user_eq (pt2 pt2) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-datatypes ((pt2__ref 0))
(((pt2__refqtmk (pt2__content pt2)))))
(define-fun pt2__ref_pt2__content__projection ((a pt2__ref)) pt2 (pt2__content
                                                                 a))

(declare-sort interrupt_priority 0)

(declare-fun interrupt_priorityqtint (interrupt_priority) Int)

;; interrupt_priority'axiom
  (assert
  (forall ((i interrupt_priority))
  (and (<= 98 (interrupt_priorityqtint i))
  (<= (interrupt_priorityqtint i) 98))))

(define-fun in_range ((x Int)) Bool (and (<= 98 x) (<= x 98)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq1 (interrupt_priority interrupt_priority) Bool)

(declare-const dummy interrupt_priority)

(declare-datatypes ((interrupt_priority__ref 0))
(((interrupt_priority__refqtmk
  (interrupt_priority__content interrupt_priority)))))
(define-fun interrupt_priority__ref_interrupt_priority__content__projection ((a interrupt_priority__ref)) interrupt_priority 
  (interrupt_priority__content a))

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

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; bad_interrupt_priority__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (bad_interrupt_priority us_void_param)))
     (=> (bad_interrupt_priority__function_guard result us_void_param)
     (dynamic_invariant result true false true true))) :pattern ((bad_interrupt_priority
                                                                 us_void_param)) )))

;; bad_interrupt_priority__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (bad_interrupt_priority us_void_param) 99) :pattern ((bad_interrupt_priority
                                                             us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= 98 98)) (in_range temp___expr_174)))

(declare-const self__ pt2)

(assert
;; defqtvc
 ;; File "p.ads", line 9, characters 0-0
  (not
  (=> (bad_interrupt_priority__function_guard (bad_interrupt_priority Tuple0)
  Tuple0) (<= 98 (bad_interrupt_priority Tuple0)))))
(check-sat)
(exit)

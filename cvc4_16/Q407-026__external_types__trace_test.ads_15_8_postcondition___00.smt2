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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((trace__ref 0))
(((trace__refqtmk (trace__content us_rep)))))
(define-fun trace__ref_trace__content__projection ((a trace__ref)) us_rep 
  (trace__content a))

(declare-fun empty (tuple0) us_rep)

(declare-fun empty__function_guard (us_rep tuple0) Bool)

;; empty__post_axiom
  (assert true)

(declare-fun append (us_rep Int) us_rep)

(declare-fun append__function_guard (us_rep us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (element_type element_type) Bool)

(declare-const dummy2 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_166)))

;; append__post_axiom
  (assert true)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep1)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep1 
  (cursor__content a))

(declare-fun element (us_rep us_rep1) Int)

(declare-fun element__function_guard (Int us_rep us_rep1) Bool)

;; element__post_axiom
  (assert
  (forall ((t us_rep))
  (forall ((c us_rep1))
  (! (let ((result (element t c)))
     (=> (element__function_guard result t c) (dynamic_invariant result true
     false true true))) :pattern ((element t c)) ))))

(declare-fun has_element (us_rep us_rep1) Bool)

(declare-fun has_element__function_guard (Bool us_rep us_rep1) Bool)

;; has_element__post_axiom
  (assert true)

(declare-fun previous (us_rep us_rep1) us_rep1)

(declare-fun previous__function_guard (us_rep1 us_rep us_rep1) Bool)

;; previous__post_axiom
  (assert true)

(declare-fun is_first (us_rep us_rep1) Bool)

(declare-fun is_first__function_guard (Bool us_rep us_rep1) Bool)

;; is_first__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "trace_test.ads", line 10, characters 0-0
  (not
  (let ((o (empty Tuple0)))
  (=> (empty__function_guard o Tuple0)
  (forall ((trace us_rep))
  (=> (= trace o)
  (forall ((trace1 us_rep))
  (=>
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i 100) true false)) true)
  (exists ((trace2 us_rep) (i1 Int))
  (and
  (= (and (ite true true false) (ite (and (<= 1 i1) (<= i1 100)) true false)) true)
  (let ((o1 (append trace2 i1)))
  (and (append__function_guard o1 trace2 i1) (and (= trace1 o1) (= i1 100))))))
  (= trace1 trace))))
  (forall ((c us_rep1))
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (has_element__function_guard
  (has_element trace2 c1) trace2 c1))
  (=> (= (has_element trace1 c) true)
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (is_first__function_guard
  (is_first trace2 c1) trace2 c1))
  (=> (not (= (is_first trace1 c) true))
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (element__function_guard
  (element trace2 c1) trace2 c1))
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (previous__function_guard
  (previous trace2 c1) trace2 c1))
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (previous__function_guard
  (previous trace2 c1) trace2 c1))
  (=>
  (forall ((trace2 us_rep) (c1 us_rep1)) (element__function_guard
  (element trace2 (previous trace2 c1)) trace2 (previous trace2 c1)))
  (= (element trace1 c) (+ (element trace1 (previous trace1 c)) 1)))))))))))))))))))
(check-sat)
(exit)

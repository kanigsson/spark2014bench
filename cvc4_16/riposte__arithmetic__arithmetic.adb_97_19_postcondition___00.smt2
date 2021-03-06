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

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const half_range Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort unsigned_byte 0)

(declare-fun unsigned_byteqtint (unsigned_byte) Int)

;; unsigned_byte'axiom
  (assert
  (forall ((i unsigned_byte))
  (and (<= 0 (unsigned_byteqtint i)) (<= (unsigned_byteqtint i) 255))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (unsigned_byte unsigned_byte) Bool)

(declare-const dummy unsigned_byte)

(declare-datatypes ((unsigned_byte__ref 0))
(((unsigned_byte__refqtmk (unsigned_byte__content unsigned_byte)))))
(define-fun unsigned_byte__ref_unsigned_byte__content__projection ((a unsigned_byte__ref)) unsigned_byte 
  (unsigned_byte__content a))

(define-fun dynamic_invariant ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 255)) (in_range1 temp___expr_178)))

(declare-sort t25b 0)

(declare-fun t25bqtint (t25b) Int)

;; t25b'axiom
  (assert
  (forall ((i t25b)) (and (<= 0 (t25bqtint i)) (<= (t25bqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t25b t25b) Bool)

(declare-const dummy1 t25b)

(declare-datatypes ((t25b__ref 0))
(((t25b__refqtmk (t25b__content t25b)))))
(define-fun t25b__ref_t25b__content__projection ((a t25b__ref)) t25b 
  (t25b__content a))

;; half_range__def_axiom
  (assert (= half_range 127))

(assert
;; defqtvc
 ;; File "arithmetic.adb", line 96, characters 0-0
  (not
  (forall ((r Int) (r1 Int) (arithmetic__halve_a__result Int))
  (=> (dynamic_invariant n true false true true)
  (=> (dynamic_invariant half_range true false true true)
  (=> (dynamic_invariant r false false true true)
  (=>
  (exists ((i Int))
  (and (= i 0)
  (ite (= (and (ite (<= 0 i) true false) (ite (<= i 127) true false)) true)
  (exists ((r2 Int))
  (and (= r2 i)
  (ite (= (or (ite (= (+ r2 r2) n) true false) (ite (= (+ (+ r2 r2) 1) 
                                               n) true false)) true)
  (= r1 r2)
  (exists ((r3 Int) (i1 Int))
  (and (and (= r3 i1) (< (+ (+ r3 r3) 1) n))
  (and
  (= (and (ite (and (in_range2 i1) (dynamic_invariant r3 false true true
               true))
          true false) (ite (and (<= 0 i1) (<= i1 127)) true false)) true)
  (ite (= i1 127) (= r1 r3)
  (exists ((i2 Int))
  (and (= i2 (+ i1 1))
  (and (= r1 i2)
  (= (or (ite (= (+ r1 r1) n) true false) (ite (= (+ (+ r1 r1) 1) n) true
                                          false)) true)))))))))))
  (= r1 r))))
  (=> (= arithmetic__halve_a__result r1)
  (or (= (+ arithmetic__halve_a__result arithmetic__halve_a__result) 
  n) (= (+ (+ arithmetic__halve_a__result arithmetic__halve_a__result) 1) 
  n))))))))))
(check-sat)
(exit)

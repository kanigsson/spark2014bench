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

(declare-sort t 0)

(declare-fun user_eq (t t) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dummy t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(declare-fun dummy1 (tuple0) t)

(declare-fun dummy__function_guard (t tuple0) Bool)

;; dummy__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__main__ptr__is_null_pointer Bool)(rec__main__ptr__pointer_address Int)(rec__main__ptr__pointer_value t)))))
(define-fun us_rep_rec__main__ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__main__ptr__is_null_pointer a))

(define-fun us_rep_rec__main__ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__main__ptr__pointer_address a))

(define-fun us_rep_rec__main__ptr__pointer_value__projection ((a us_rep)) t 
  (rec__main__ptr__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__main__ptr__is_null_pointer a) (rec__main__ptr__is_null_pointer
                                                               b))
                        (=>
                        (not (= (rec__main__ptr__is_null_pointer a) true))
                        (and
                        (= (rec__main__ptr__pointer_address a) (rec__main__ptr__pointer_address
                                                               b))
                        (= (rec__main__ptr__pointer_value a) (rec__main__ptr__pointer_value
                                                             b)))))
                   true false))

(define-fun rec__main__ptr__pointer_value__pred ((a us_rep)) Bool (not
                                                                  (= 
                                                                  (rec__main__ptr__is_null_pointer
                                                                  a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__main__ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy2 us_rep)

(declare-datatypes ((name__ref 0))
(((name__refqtmk (name__content us_rep)))))
(define-fun name__ref_name__content__projection ((a name__ref)) us_rep 
  (name__content a))

(define-fun default_initial_assumption ((temp___expr_203 us_rep)
  (temp___skip_top_level_204 Bool)) Bool (= (rec__main__ptr__is_null_pointer
                                            temp___expr_203) true))

(declare-const dummy3 us_rep)

(declare-datatypes ((ptr__ref 0))
(((ptr__refqtmk (ptr__content us_rep)))))
(define-fun ptr__ref_ptr__content__projection ((a ptr__ref)) us_rep (ptr__content
                                                                    a))

(define-fun default_initial_assumption1 ((temp___expr_189 us_rep)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__main__ptr__is_null_pointer
                                            temp___expr_189) true))

(assert
;; defqtvc
 ;; File "main.adb", line 3, characters 0-0
  (not
  (let ((o (dummy1 Tuple0)))
  (=> (dummy__function_guard o Tuple0)
  (forall ((us_next_pointer_address Int))
  (forall ((main__x__assume us_rep))
  (=>
  (= (and (ite (and
               (not
               (= (rec__main__ptr__is_null_pointer main__x__assume) true))
               (= (rec__main__ptr__pointer_address main__x__assume) us_next_pointer_address))
          true false) (ite (= (rec__main__ptr__pointer_value main__x__assume) o)
                      true false)) true)
  (forall ((x__pointer_value t))
  (=> (= x__pointer_value (rec__main__ptr__pointer_value main__x__assume))
  (forall ((x__pointer_address Int))
  (=>
  (= x__pointer_address (rec__main__ptr__pointer_address main__x__assume))
  (forall ((x__is_null_pointer Bool))
  (=>
  (= x__is_null_pointer (rec__main__ptr__is_null_pointer main__x__assume))
  (not
  (= (bool_eq
     (us_repqtmk x__is_null_pointer x__pointer_address x__pointer_value)
     us_null_pointer) true)))))))))))))))
(check-sat)
(exit)

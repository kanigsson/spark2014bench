;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__dic2__nested__parent us_main_type)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__dic2__nested__parent__projection ((a us_split_fields)) us_main_type 
  (rec__dic2__nested__parent a))

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

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (us_main_eq
                           (rec__dic2__nested__parent (us_split_fields1 a))
                           (rec__dic2__nested__parent (us_split_fields1 b))) true)
                   true false))

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
((child__ref (child__refqtmk (child__content us_rep)))))
(define-fun child__ref_child__content__projection ((a child__ref)) us_rep 
  (child__content a))

(declare-fun is_ok (us_rep) Bool)

(declare-fun is_ok__function_guard (Bool us_rep) Bool)

(declare-fun is_ok1 (Int us_rep) Bool)

(declare-fun is_ok__function_guard1 (Bool Int us_rep) Bool)

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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

(declare-datatypes ()
((parent__ref (parent__refqtmk (parent__content us_rep)))))
(define-fun parent__ref_parent__content__projection ((a parent__ref)) us_rep 
  (parent__content a))

(declare-fun is_ok2 (us_rep) Bool)

(declare-fun is_ok__function_guard2 (Bool us_rep) Bool)

(declare-fun is_ok3 (Int us_rep) Bool)

(declare-fun is_ok__function_guard3 (Bool Int us_rep) Bool)

;; dic2__child__compat_axiom
  (assert
  (forall ((obj us_rep))
  (! (=> (is_ok__function_guard1 (is_ok1 us_tag obj) us_tag obj)
     (and (forall ((obj1 us_rep)) (is_ok__function_guard (is_ok obj1) obj1))
     (= (ite (is_ok obj) 1 0) (ite (is_ok1 us_tag obj) 1 0)))) :pattern (
  (is_ok1 us_tag obj)) )))

;; is_ok__def_axiom
  (assert
  (forall ((obj us_rep))
  (! (and
     (forall ((obj1 us_rep)) (is_ok__function_guard2 (is_ok2 obj1) obj1))
     (= (= (is_ok obj) true) (not (= (is_ok2 obj) true)))) :pattern (
  (is_ok obj)) )))

;; temp___result_175'def
  (assert
  (forall ((temp___174 us_rep)) (is_ok__function_guard (is_ok temp___174)
  temp___174)))

(define-fun default_initial_assumption ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (and
                                         (= (attr__tag temp___expr_172) 
                                         us_tag)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_173 true))
                                         (= (is_ok temp___expr_172) true))))

;; temp___result_164'def
  (assert
  (forall ((temp___163 us_rep)) (is_ok__function_guard2 (is_ok2 temp___163)
  temp___163)))

(define-fun default_initial_assumption1 ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (and
                                         (= (attr__tag temp___expr_161) 
                                         us_tag1)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_162 true))
                                         (= (is_ok2 temp___expr_161) true))))

;; dic2__nested__parent__compat_axiom
  (assert
  (forall ((obj us_rep))
  (! (=> (is_ok__function_guard3 (is_ok3 us_tag1 obj) us_tag1 obj)
     (and
     (forall ((obj1 us_rep)) (is_ok__function_guard2 (is_ok2 obj1) obj1))
     (= (ite (is_ok2 obj) 1 0) (ite (is_ok3 us_tag1 obj) 1 0)))) :pattern (
  (is_ok3 us_tag1 obj)) )))

;; dic2__child__compat_axiom
  (assert
  (forall ((obj us_rep))
  (! (=> (is_ok__function_guard3 (is_ok3 us_tag obj) us_tag obj)
     (and (forall ((obj1 us_rep)) (is_ok__function_guard (is_ok obj1) obj1))
     (= (ite (is_ok obj) 1 0) (ite (is_ok3 us_tag obj) 1 0)))) :pattern (
  (is_ok3 us_tag obj)) )))

(declare-const usf us_rep)

;; H
  (assert (forall ((usf1 us_rep)) (is_ok__function_guard (is_ok usf1) usf1)))

;; H
  (assert true)

;; H
  (assert (= (attr__tag usf) us_tag))

;; H
  (assert true)

;; H
  (assert (forall ((usf1 us_rep)) (is_ok__function_guard (is_ok usf1) usf1)))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-PA19-039__inherited_dic-25845/src/gnatprove/dic2__child.mlw", line 401, characters 5-8
  (not (= (is_ok usf) true)))
(check-sat)